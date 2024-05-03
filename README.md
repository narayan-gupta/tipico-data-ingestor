# tipico-data-ingestor


Tipico Data Ingestor Airflow Dag 

The dag run can be seen here.
https://console.cloud.google.com/composer/dags/us-central1/tipico-data-ingestor/tipico_python_ingestor/runs?_ga=2.2783796.-563720813.1708965211&_gac=1.124116344.1714758023.Cj0KCQjwltKxBhDMARIsAG8KnqVjZAdWVkIJD47_yLpIarXudXCmH3xu2YyEzi8JtOBiNEVKLzpS0NYaAj6cEALw_wcB&hl=en&project=growthscript

The airflow dag runs on Google cloud runner and outputs to this gcs bucket 
https://console.cloud.google.com/storage/browser/data-fetch-output;tab=permissions?hl=en&project=growthscript

The dag should be inside of the enviroment provided but if you need to reupload it run this command. 

 gcloud composer environments storage dags import \
    --environment  tipico-data-ingestor \
    --location us-central1 \
    --source="dags/data-fetcher.py"


Data Model for downloaded data
![Alt Text](data-model.png)