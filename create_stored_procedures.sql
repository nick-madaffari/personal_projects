DROP PROCEDURE IF EXISTS insert_clothing_data;
DELIMITER $$
CREATE PROCEDURE insert_clothing_data (
    pair_of_jeans DECIMAL(5,2),
    summer_dress DECIMAL(5,2),
    nike_running_shoes DECIMAL(5,2),
    leather_business_shoes DECIMAL(5,2)
)
BEGIN
	INSERT INTO clothing_cost_sets
	VALUES (
		(SELECT MAX(update_id) FROM updates),
        pair_of_jeans,
        summer_dress,
        nike_running_shoes,
        leather_business_shoes
	);
END $$
DELIMITER ;


DROP PROCEDURE IF EXISTS insert_leisure_data;
DELIMITER $$
CREATE PROCEDURE insert_leisure_data (
    fit_club_one_month DECIMAL(5,2),
    tennis_court_one_hr DECIMAL(5,2),
    cinema_ticket_one_seat DECIMAL(4,2)
)
BEGIN
	INSERT INTO leisure_cost_sets
	VALUES (
		(SELECT MAX(update_id) FROM updates),
        fit_club_one_month,
        tennis_court_one_hr,
        cinema_ticket_one_seat
	);
END $$
DELIMITER ;


DROP PROCEDURE IF EXISTS insert_market_data;
DELIMITER $$
CREATE PROCEDURE insert_market_data (
	milk_one_liter DECIMAL(4,2),
    bread_loaf DECIMAL(4,2),
    white_rice_one_kg DECIMAL(4,2),
    dozen_eggs DECIMAL(4,2),
    cheese_one_kg DECIMAL(5,2),
    chicken_breast_one_kg DECIMAL(4,2),
    beef_round_one_kg DECIMAL(4,2),
    apples_one_kg DECIMAL(4,2),
    bananas_one_kg DECIMAL(4,2),
    oranges_one_kg DECIMAL(4,2),
    tomatoes_one_kg DECIMAL(4,2),
    potatoes_one_kg DECIMAL(4,2),
    onions_one_kg DECIMAL(4,2),
    lettuce_head DECIMAL(4,2),
    water_one_and_half_liter DECIMAL(4,2),
    wine_mid_range DECIMAL(5,2),
    domestic_beer_half_liter DECIMAL(4,2),
    imported_beer_third_liter DECIMAL(4,2),
    cigarettes_pack DECIMAL(4,2)
)
BEGIN
	INSERT INTO market_cost_sets
	VALUES (
		(SELECT MAX(update_id) FROM updates),
        milk_one_liter,
		bread_loaf,
		white_rice_one_kg,
		dozen_eggs,
		cheese_one_kg,
		chicken_breast_one_kg,
		beef_round_one_kg,
		apples_one_kg,
		bananas_one_kg,
		oranges_one_kg,
		tomatoes_one_kg,
		potatoes_one_kg,
		onions_one_kg,
		lettuce_head,
		water_one_and_half_liter,
		wine_mid_range,
		domestic_beer_half_liter,
		imported_beer_third_liter,
		cigarettes_pack
	);
END $$
DELIMITER ;


DROP PROCEDURE IF EXISTS insert_rent_data;
DELIMITER $$
CREATE PROCEDURE insert_rent_data (
    apt_one_bdrm_ctr DECIMAL(7,2),
    apt_one_bdrm_out DECIMAL(7,2),
    apt_three_bdrm_ctr DECIMAL(7,2),
    apt_three_bdrm_out DECIMAL(7,2)
)
BEGIN
	INSERT INTO rent_cost_sets
	VALUES (
		(SELECT MAX(update_id) FROM updates),
        apt_one_bdrm_ctr,
		apt_one_bdrm_out,
		apt_three_bdrm_ctr,
		apt_three_bdrm_out
	);
END $$
DELIMITER ;


DROP PROCEDURE IF EXISTS insert_restaurant_data;
DELIMITER $$
CREATE PROCEDURE insert_restaurant_data (
    cheap_meal_for_one DECIMAL(5,2),
    meal_for_two DECIMAL(5,2),
    mcdonalds_meal DECIMAL(4,2),
    domestic_beer DECIMAL(4,2),
    imported_beer DECIMAL(4,2),
    cappuccino DECIMAL(4,2),
    coke_or_pepsi DECIMAL(4,2),
    water DECIMAL(4,2)
)
BEGIN
	INSERT INTO restaurant_cost_sets
	VALUES (
		(SELECT MAX(update_id) FROM updates),
        cheap_meal_for_one,
		meal_for_two,
		mcdonalds_meal,
		domestic_beer,
        imported_beer,
		cappuccino,
		coke_or_pepsi,
		water
	);
END $$
DELIMITER ;


DROP PROCEDURE IF EXISTS insert_transportation_data;
DELIMITER $$
CREATE PROCEDURE insert_transportation_data (
    local_transit_one_way DECIMAL (4,2),
    monthly_transit_pass DECIMAL (5,2),
    taxi_base_fare DECIMAL (4,2),
    taxi_one_km DECIMAL (4,2),
    taxi_one_hr DECIMAL (5,2),
    gasoline_one_liter DECIMAL (4,2),
    volkswagen_golf DECIMAL (8,2),
    toyota_corolla DECIMAL (8,2)
)
BEGIN
	INSERT INTO transportation_cost_sets
	VALUES (
		(SELECT MAX(update_id) FROM updates),
        local_transit_one_way,
		monthly_transit_pass,
		taxi_base_fare,
		taxi_one_km,
		taxi_one_hr,
		gasoline_one_liter,
		volkswagen_golf,
		toyota_corolla
	);
END $$
DELIMITER ;


DROP PROCEDURE IF EXISTS insert_update_data;
DELIMITER $$
CREATE PROCEDURE insert_update_data (
    city_id SMALLINT,
    date DATETIME
)
BEGIN
	INSERT INTO updates
	VALUES (
		DEFAULT,
        city_id,
        date
	);
END $$
DELIMITER ;


DROP PROCEDURE IF EXISTS insert_utilities_data;
DELIMITER $$
CREATE PROCEDURE insert_utilities_data (
    all_basic DECIMAL(6,2),
    prepaid_mobile_one_min DECIMAL(4,2),
    internet_sixty_mbps DECIMAL(5,2)
)
BEGIN
	INSERT INTO utilities_cost_sets
	VALUES (
		(SELECT MAX(update_id) FROM updates),
        all_basic,
		prepaid_mobile_one_min,
		internet_sixty_mbps
	);
END $$
DELIMITER ;