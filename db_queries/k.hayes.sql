
COPY(
    SELECT * FROM pitch_18_24 
    WHERE "batter" like '%kebryan hayes%'
) TO 'C:/Database/data/db_queries/player/khayes_pitch_data.csv' WITH CSV HEADER;

COPY (
    SELECT 
        bat_tracking_23_24.name,
        bat_tracking_23_24.season,
        bat_tracking_23_24.*,
        fg_02_24.*,
        stc_15_24.*,
        swing_value_18_24.*
    FROM bat_tracking_23_24
    LEFT JOIN fg_02_24 
        ON bat_tracking_23_24.name = fg_02_24.name 
        AND bat_tracking_23_24.season = fg_02_24.season
    LEFT JOIN stc_15_24 
        ON bat_tracking_23_24.name = stc_15_24.name
        AND bat_tracking_23_24.season = stc_15_24.season
    LEFT JOIN swing_value_18_24 
        ON bat_tracking_23_24.name = swing_value_18_24.name
        AND bat_tracking_23_24.season = swing_value_18_24.season
    WHERE bat_tracking_23_24."name" LIKE '%kebryan hayes%'
) TO 'C:/Database/data/db_queries/player/khayes_season_data.csv' WITH CSV HEADER;