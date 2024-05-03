from __future__ import annotations

import logging
import sys
import time
import json
import requests
import pendulum
import os
from google.cloud import storage
from airflow.decorators import dag, task
log = logging.getLogger(__name__)
PATH_TO_PYTHON_BINARY = sys.executable

@dag(
    schedule_interval='*/10 * * * *',
    dag_id="tipico_python_ingestor",
    start_date=pendulum.datetime(2021, 1, 1, tz="UTC"),
    catchup=False,
    tags=["example"],
)

def tipico_data_decorator():
    # [START request_data]
    @task(task_id="request_data")
    def fetch_data(ds=None, **kwargs):
        endpoint = "https://trading-api.tipico.us/v1/pds/lbc/events/live?licenseId=US-NJ&lang=en&limit=18"
        response = requests.get(endpoint)
        data = response.json()
        # Set up GCS client
        client = storage.Client()

        # Define GCS bucket and file path
        bucket_name = "data-fetch-output"

        output_file_path = 'tipico_data_formatted.json'

    # Format Data so we can load into big query
        with open(output_file_path, 'w') as ndjson_file:
            for entry in data:
            # Write each entry as a newline-delimited JSON object
                ndjson_file.write(json.dumps(entry) + '\n')

        # Upload file to GCS
        bucket = client.get_bucket(bucket_name)
        blob = bucket.blob(output_file_path)
        blob.upload_from_filename(output_file_path)

        # Delete local file
        os.remove(output_file_path)
        return data

    run_this = fetch_data()
    # [END request_data]

tipico_data_decorator()