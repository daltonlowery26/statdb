-- Active: 1747588244668@@127.0.0.1@5432@baseball
COPY pitch_15_24
TO 'C:/Database/data/db_queries/pitch.csv'
WITH (FORMAT CSV, HEADER TRUE, DELIMITER ',');