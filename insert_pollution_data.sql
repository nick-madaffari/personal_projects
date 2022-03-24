DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `insert_pollution_data`(
    datetime DATETIME,
    country VARCHAR(45),
    state VARCHAR(45),
    city VARCHAR(45),
    us_aqi INT,
    cn_aqi INT
)
BEGIN
	INSERT INTO pollution
	VALUES (
		DEFAULT,
        datetime,
        country,
        state,
        city,
        us_aqi,
        cn_aqi
        );
END $$
DELIMITER ;