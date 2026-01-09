import os
import mysql.connector
from dotenv import load_dotenv

load_dotenv()

def test_mysql_connection():
    conn = mysql.connector.connect(
        host=os.getenv("MYSQL_HOST"),
        user=os.getenv("MYSQL_USER"),
        password=os.getenv("MYSQL_PASSWORD"),
        database=os.getenv("MYSQL_DB")
    )

    assert conn.is_connected()
    conn.close()

if __name__ == "__main__":
    test_mysql_connection()
    print("MySQL connection test passed.")
