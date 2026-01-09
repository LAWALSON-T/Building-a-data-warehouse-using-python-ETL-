from airflow import DAG
from airflow.operators.bash import BashOperator
from datetime import datetime

with DAG(
    dag_id="steam_etl_pipeline",
    start_date=datetime(2024, 1, 1),
    schedule_interval="@daily",
    catchup=False
) as dag:

    run_etl = BashOperator(
        task_id="run_etl",
        bash_command="python /opt/airflow/miner/run_etl.py"
    )
