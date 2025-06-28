COPY(
SELECT
    s.name,
    s.season,
    f.pa,
    f.k_pct,
    s.whiff_percent,
    s.swing_percent,
    s.sweet_spot_pct,
    f.z_contact_pct,
    f.o_swing_pct,
    f.contact_pct,
    v.chase_value,
    v.breaking_value,
    v.fastball_value

FROM
    stc_15_24 s
JOIN
    fg_02_24 f
    ON s.name = f.name AND s.season = f.season
JOIN
    swing_value_15_24 v 
    ON s.name = v.name AND s.season = v.season
ORDER BY
    s.name,
    s.season
) TO 'C:/Database/data/db_queries/strikeout.csv' WITH CSV HEADER;
