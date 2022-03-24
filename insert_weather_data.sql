DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `insert_weather_data`(
    datetime DATETIME,
    country VARCHAR(45),
    state VARCHAR(45),
    city VARCHAR(45),
    temperature INT,
    pressure INT,
    humidity INT,
    wind_speed DECIMAL(4,2),
    wind_direction INT
)
BEGIN
	INSERT INTO weather
	VALUES (
		DEFAULT,
        datetime,
        country,
        state,
        city,
        temperature,
        pressure,
        humidity,
        wind_speed,
        wind_direction
        );
END $$
DELIMITER ;