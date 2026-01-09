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

# Check for negative prices
cursor.execute("SELECT COUNT(*) FROM fact_games WHERE Price < 0")
assert cursor.fetchone()[0] == 0

# Check for missing AppIDs
cursor.execute("SELECT COUNT(*) FROM dim_game_info WHERE AppID IS NULL")
assert cursor.fetchone()[0] == 0

# Check owner count sanity
cursor.execute("SELECT COUNT(*) FROM dim_game_info WHERE Estimated_owners < 0")
assert cursor.fetchone()[0] == 0

print("Data quality tests passed.")

cursor.close()
conn.close()
