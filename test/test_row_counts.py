import os
import mysql.connector
from dotenv import load_dotenv

load_dotenv()

def get_count(table):
    conn = mysql.connector.connect(
        host=os.getenv("MYSQL_HOST"),
        user=os.getenv("MYSQL_USER"),
        password=os.getenv("MYSQL_PASSWORD"),
        database=os.getenv("MYSQL_DB")
    )
    cursor = conn.cursor()
    cursor.execute(f"SELECT COUNT(*) FROM {table}")
    count = cursor.fetchone()[0]
    cursor.close()
    conn.close()
    return count

def test_row_counts():
    fact_rows = get_count("fact_games")
    dim_rows = get_count("dim_game_info")

    assert fact_rows > 0
    assert dim_rows > 0

    print("Rows in fact_games:", fact_rows)
    print("Rows in dim_game_info:", dim_rows)

if __name__ == "__main__":
    test_row_counts()
