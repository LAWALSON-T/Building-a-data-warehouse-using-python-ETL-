import os
import mysql.connector

def get_connection():
    return mysql.connector.connect(
        host=os.getenv("MYSQL_HOST"),
        user=os.getenv("MYSQL_USER"),
        password=os.getenv("MYSQL_PASSWORD"),
        database=os.getenv("MYSQL_DB")
    )

def bulk_insert(df, table):
    conn = get_connection()
    cursor = conn.cursor()

    cols = ",".join(df.columns)
    placeholders = ",".join(["%s"] * len(df.columns))
    sql = f"INSERT INTO {table} ({cols}) VALUES ({placeholders})"

    cursor.executemany(sql, df.values.tolist())
    conn.commit()

    cursor.close()
    conn.close()
