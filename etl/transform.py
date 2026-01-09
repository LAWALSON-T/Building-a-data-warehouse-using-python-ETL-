import dask.dataframe as dd
import pandas as pd

def clean_and_transform(df):
    df.columns = df.columns.str.replace(" ", "_")

    df["Full_audio_languages"] = df["Full_audio_languages"].str.replace(r"[\[\]']", "", regex=True)
    df["Reviews"] = df["Reviews"].str.replace(r"[\[\]']", "", regex=True)

    split_cols = ["Full_audio_languages", "Reviews", "Categories", "Genres", "Tags"]
    for col in split_cols:
        df[col] = df[col].str.split(",")

    for col in split_cols:
        df = df.explode(col)

    def convert_estimated(value):
        try:
            return int(value.split(" - ")[1])
        except:
            return 0

    df["Estimated_owners"] = df["Estimated_owners"].apply(convert_estimated, meta=("Estimated_owners", "int64"))
    df["Release_date"] = dd.to_datetime(df["Release_date"], errors="coerce")
    df["Price"] = df["Price"].astype(float).round(2)
    df["User_score"] = df["User_score"].fillna(0).astype(float)

    return df.compute()
