def test_task_dependencies():
    dagbag = DagBag(dag_folder="dags", include_examples=False)
    dag = dagbag.get_dag("steam_etl_pipeline")

    run_task = dag.get_task("run_etl")
    assert len(run_task.upstream_task_ids) == 0
