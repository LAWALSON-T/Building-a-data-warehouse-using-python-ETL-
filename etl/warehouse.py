import pandas as pd

def build_dimensions(df):

    dim_game_info = df[[
        "AppID","Name","Release_date","Estimated_owners",
        "Required_age","About_the_game","Supported_languages",
        "Full_audio_languages","Notes"
    ]].drop_duplicates()

    dim_platforms = df[["AppID","Windows","Mac","Linux"]].drop_duplicates().reset_index(drop=True)
    dim_platforms["PlatformID"] = dim_platforms.index + 1

    dim_reviews = df[["AppID","Reviews","Metacritic_score","User_score"]].drop_duplicates().reset_index(drop=True)
    dim_reviews["ReviewID"] = dim_reviews.index + 1

    fact_games = df[["AppID","Peak_CCU","Price","Positive","Negative"]].drop_duplicates()

    fact_games["PlatformID"] = fact_games["AppID"].map(dim_platforms.set_index("AppID")["PlatformID"])
    fact_games["ReviewID"] = fact_games["AppID"].map(dim_reviews.set_index("AppID")["ReviewID"])

    return dim_game_info, dim_platforms, dim_reviews, fact_games
