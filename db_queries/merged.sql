
COPY (
SELECT *
FROM fg_02_24 f
LEFT JOIN bat_tracking_23_24 b ON f.name = b.name AND f.season = b.season
LEFT JOIN swing_value_18_24 s ON f.name = s.name AND f.season = s.season
LEFT JOIN stc_15_24 l ON f.name = l.name AND f.season = l.season
) TO 'C:/Database/data/db_queries/merged_data.csv' WITH CSV HEADER;
