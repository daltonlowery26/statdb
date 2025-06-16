-- Active: 1747588244668@@127.0.0.1@5432@baseball
-- SQLBook: Code

CREATE DATABASE Baseball;

DROP DATABASE chinook;

DROP Table fg_02_24;

CREATE TABLE fg_02_24 (
	Season INT,
	Name VARCHAR(100),
	PA INT,
	Age INT,
	BB_PCT DECIMAL(5,3),
	K_PCT DECIMAL(5,3),
	BABIP DECIMAL(5,3),
	wOBA DECIMAL(5,3),
	wRC_Plus DECIMAL(6,1),
	BsR DECIMAL(5,1),
	Off DECIMAL(5,1),
	Def DECIMAL(5,1),
	WAR DECIMAL(5,1),
	O_Swing_PCT DECIMAL(5,3),
	Z_Swing_PCT DECIMAL(5,3),
	Z_Contact_PCT DECIMAL(5,3),
	Contact_PCT DECIMAL(5,3),
	SwStr_PCT DECIMAL(5,3),
	CSW_PCT DECIMAL(5,3)
);

COPY fg_02_24
FROM 'C:/Database/data/db/data_02_24.csv'
WITH (FORMAT CSV, HEADER TRUE, DELIMITER ',');

DROP TABLE pitch_18_24;

CREATE TABLE pitch_18_24 (
	Season INT,
	Pitch_ABV VARCHAR(50),
	Pitch_Name VARCHAR(100),
	Batter VARCHAR(100),
	Pitcher VARCHAR(100),
	Description VARCHAR(200),
	Statcast_Zone DECIMAL(7,3),
	XWOBA DECIMAL(7, 3),
	B_Stand VARCHAR(10),
	P_Throws VARCHAR(10),
	Type VARCHAR(10),
	Balls INT,
	Strikes INT,
	Plate_Horz DECIMAL(7,3),
	Plate_Vert DECIMAL(7, 3),
	pitch_speed DECIMAL (7,3),
	SZ_Top DECIMAL(7,3),
	SZ_Bot DECIMAL(7,3),
	Extension DECIMAL(7, 3),
	arm_angle DECIMAL (7,3),
	spin_rate DECIMAL (7,3),
	time_through_order INT,
	bat_speed DECIMAL (7,3),
	swing_length DECIMAL (7,3),
	tilt DECIMAL (7, 3),
	attack_angle DECIMAL (7, 3),
	intercept_y DECIMAL (7,3),
	intercept_x DECIMAL (7,3),
	attack_direction DECIMAL (7,3),
	nzone INT


);


COPY pitch_18_24
FROM 'C:/Database/data/db/pitch_18_24.csv'
WITH (FORMAT CSV, HEADER TRUE, DELIMITER ',');

DROP TABLE swing_value_18_24

CREATE TABLE swing_value_18_24 (
	Name VARCHAR(100),
	Season INT,
	Chase_Value DECIMAL(7,4),
	Overall_Value DECIMAL(7,4),
	Pitch_count INT,
	Breaking_Value DECIMAL(7,4),
	Fastball_Value DECIMAL(7,4),
	Offspeed_Value DECIMAL(7,4)
);

COPY swing_value_18_24
FROM 'C:/Database/data/db/swing_values.csv'
WITH (FORMAT CSV, HEADER TRUE, DELIMITER ',');


DROP TABLE bat_tracking_23_24;

CREATE TABLE bat_tracking_23_24 (
	Name VARCHAR(100),
	Season INT,
	Avg_bat_speed DECIMAL(4,2),
	Fast_swing_rate DECIMAL(4, 2),
	Blasts_contact DECIMAL(4,2),
	Blasts_swing DECIMAL(4, 2),
	Squared_up_contact DECIMAL(4, 2),
	Squared_up_swing DECIMAL (4,2),
	Average_swing_length DECIMAL (4,2),
	Swords INT,
	Attack_angle DECIMAL(4,2),
	Attack_direction DECIMAL(4,2),
	Ideal_angle DECIMAL(4,2),
	Vertical_swing_path DECIMAL(4,2),
	Time_to_contact DECIMAL(6, 5)

);

COPY bat_tracking_23_24
FROM 'C:/Database/data/db/bat_tracking.csv'
WITH (FORMAT CSV, HEADER TRUE, DELIMITER ',');

CREATE TABLE stc_15_24 (
	Name VARCHAR(100),
	Season Int,
	xwoba DECIMAL(5, 3),
	xwobacon DECIMAL(5, 3),
	sweet_spot_pct DECIMAL (5, 2),
	barrel_rate DECIMAL(5, 2),
	hard_hit_pct DECIMAL (5, 2),
	ev50 DECIMAL(7, 3),
	adj_ev DECIMAL(7,3),
	whiff_percent DECIMAL (5, 2),
	swing_percent DECIMAL (5, 2),
	pull_pct DECIMAL(5, 2),
	center_pct DECIMAL (5, 2),
	opposite_pct DECIMAL (5,2)
);

COPY stc_15_24
FROM 'C:/Database/data/db/stc_15_24.csv'
WITH (FORMAT CSV, HEADER TRUE, DELIMITER ',');