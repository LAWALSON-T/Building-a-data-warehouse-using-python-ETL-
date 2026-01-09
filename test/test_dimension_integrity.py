import os
import mysql.connector
from dotenv import load_dotenv

load_dotenv()

conn = mysql.connector.connect(
    host=os.getenv("MYSQL_HOST"),
    user=os.getenv("MYSQL_USER"),
    password=os.getenv("MYSQL_PASSWORD"),
    database=os.getenv("MYSQL_DB")
)

cursor = conn.cursor()

queries = {
    "platform": """
        SELECT COUNT(*) 
        FROM fact_games f
        LEFT JOIN dim_platforms p 
        ON f.PlatformID = p.PlatformID
        WHERE p.PlatformID IS NULL
    """,
    "reviews": """
        SELECT COUNT(*) 
        FROM fact_games f
        LEFT JOIN dim_reviews r 
        ON f.ReviewID = r.ReviewID
        WHERE r.ReviewID IS NULL
    """
}

for name, q in queries.items():
    cursor.execute(q)
    bad_rows = cursor.fetchone()[0]
    assert bad_rows == 0, f"{name} dimension has broken foreign keys"

print("All dimension integrity checks passed.")

cursor.close()
conn.close()
