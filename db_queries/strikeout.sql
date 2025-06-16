COPY(
SELECT
    s.name,
    s.season,
    s.whiff_percent,
    s.swing_percent,
    f.o_swing_pct,
    f.k_pct,
    f.z_contact_pct,
    f.contact_pct
FROM
    stc_15_24 s
JOIN
    fg_02_24 f
    ON s.name = f.name AND s.season = f.season
ORDER BY
    s.name,
    s.season
) TO 'C:/Database/data/db_queries/strikeout.csv' WITH CSV HEADER;
