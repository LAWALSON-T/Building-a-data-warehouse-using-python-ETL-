from airflow.models import DagBag

def test_dag_loaded():
    dagbag = DagBag(dag_folder="dags", include_examples=False)

    assert "steam_etl_pipeline" in dagbag.dags
    assert dagbag.import_errors == {}

def test_dag_structure():
    dagbag = DagBag(dag_folder="dags", include_examples=False)
    dag = dagbag.get_dag("steam_etl_pipeline")

    tasks = dag.tasks
    task_ids = [task.task_id for task in tasks]

    assert "run_etl" in task_ids
