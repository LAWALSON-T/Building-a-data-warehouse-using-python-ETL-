import os
from dotenv import load_dotenv
from extract import load_data
from transform import clean_and_transform
from warehouse import build_dimensions
from load import bulk_insert

load_dotenv()

df = load_data(os.getenv("FILE_PATH"))
df = clean_and_transform(df)

dim_game_info, dim_platforms, dim_reviews, fact_games = build_dimensions(df)

bulk_insert(dim_game_info, "dim_game_info")
bulk_insert(dim_platforms, "dim_platforms")
bulk_insert(dim_reviews, "dim_reviews")
bulk_insert(fact_games, "fact_games")
