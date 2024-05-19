----------------------
-- Quality Checks
----------------------

/* Query Checks */

-- QC01: Variety of checks to ensure data and table structure has been transferred correctly from the source file

-- QC01.1 - Count rows
--        - Result: 3,480. Matches source.

SELECT 
	count(*)
FROM
	sn_dynamo sd 

	
-- QC01.2 - Count distinct rows
--        - Result: 3,480. Matches source.

SELECT 
	count(*)
FROM
	(
	SELECT DISTINCT *
	FROM sn_dynamo sd 
	) x


-- QC01.3 - Count Columns 
--        - Result: 36. Matches source.

SELECT 
COUNT(*) AS col_count
FROM 
information_schema.COLUMNS
WHERE 
table_name = 'sn_dynamo';


-- QC01.4 - Sum of Columns Sums 
--        - Sum of Columns used: item_price, shipping_price, total_amount, profit_inr, cost_price
--        - Result: 4493700.789999979. Matches source.

SELECT 
	sum(item_price) + sum(shipping_price) + sum(total_amount) + sum(profit_inr) + sum(cost_price)
FROM
	sn_dynamo sd


-- QC01.5 - Sum of Rows Sums 
--        - Sum of Columns used: item_price, shipping_price, total_amount, profit_inr, cost_price
--        - Result: 4493700.789999979. Matches source.

SELECT
	sum(item_price + shipping_price + total_amount + profit_inr + cost_price)
FROM
	sn_dynamo sd


-- QC01.6 - Date format check
--        - Selection of 5 records to verify that date matches the source
--        - Result: Matches source.

SELECT 
	"date"
FROM
	sn_dynamo sd 
WHERE 
	id IN (20, 150, 277, 786, 1453)


-- QC01.7 - Selection of 5 records to verify the data has been successfully imported into the database
--        - Result: Matches source.
	
SELECT 
	*
FROM
	sn_dynamo sd 
WHERE 
	id IN (87, 692, 1235, 2333, 3450)

-- QC02: Checking the location and distribution of the NULL values

-- QC02.1 - Count of nulls in each column
--        - Result: No nulls in any of the columns. Matches source.

SELECT 
	SUM(CASE WHEN id IS NULL THEN 1 ELSE 0 END) AS id_nulls ,
	SUM(CASE WHEN purchase_date IS NULL THEN 1 ELSE 0 END) AS purchase_date_nulls ,
	SUM(CASE WHEN "date" IS NULL THEN 1 ELSE 0 END) AS date_nulls ,
	SUM(CASE WHEN "time" IS NULL THEN 1 ELSE 0 END) AS time_nulls ,
	SUM(CASE WHEN "quarter" IS NULL THEN 1 ELSE 0 END) AS quarter_nulls ,
	SUM(CASE WHEN qtr IS NULL THEN 1 ELSE 0 END) AS qtr_nulls ,
	SUM(CASE WHEN "year" IS NULL THEN 1 ELSE 0 END) AS year_nulls ,
	SUM(CASE WHEN "month" IS NULL THEN 1 ELSE 0 END) AS month_nulls ,
	SUM(CASE WHEN date_1 IS NULL THEN 1 ELSE 0 END) AS date_1_nulls ,
	SUM(CASE WHEN special_day IS NULL THEN 1 ELSE 0 END) AS special_day_nulls ,
	SUM(CASE WHEN online_sale_offers IS NULL THEN 1 ELSE 0 END) AS online_sale_offers_nulls ,
	SUM(CASE WHEN "day" IS NULL THEN 1 ELSE 0 END) AS day_nulls ,
	SUM(CASE WHEN weekend IS NULL THEN 1 ELSE 0 END) AS weekend_nulls ,
	SUM(CASE WHEN morning IS NULL THEN 1 ELSE 0 END) AS morning_nulls ,
	SUM(CASE WHEN afternoon IS NULL THEN 1 ELSE 0 END) AS afternoon_nulls ,
	SUM(CASE WHEN evening IS NULL THEN 1 ELSE 0 END) AS evening_nulls ,
	SUM(CASE WHEN night IS NULL THEN 1 ELSE 0 END) AS night_nulls ,
	SUM(CASE WHEN gender IS NULL THEN 1 ELSE 0 END) AS gender_nulls ,
	SUM(CASE WHEN customer_id IS NULL THEN 1 ELSE 0 END) AS customer_id_nulls ,
	SUM(CASE WHEN gender_f_m IS NULL THEN 1 ELSE 0 END) AS gender_f_m_nulls ,
	SUM(CASE WHEN product_name IS NULL THEN 1 ELSE 0 END) AS product_name_nulls ,
	SUM(CASE WHEN item_status IS NULL THEN 1 ELSE 0 END) AS item_status_nulls ,
	SUM(CASE WHEN quantity IS NULL THEN 1 ELSE 0 END) AS quantity_nulls ,
	SUM(CASE WHEN currency IS NULL THEN 1 ELSE 0 END) AS currency_nulls ,
	SUM(CASE WHEN item_price IS NULL THEN 1 ELSE 0 END) AS item_price_nulls ,
	SUM(CASE WHEN shipping_price IS NULL THEN 1 ELSE 0 END) AS shipping_price_nulls ,
	SUM(CASE WHEN ship_city IS NULL THEN 1 ELSE 0 END) AS ship_city_nulls ,
	SUM(CASE WHEN ship_state IS NULL THEN 1 ELSE 0 END) AS shipe_state_nulls ,
	SUM(CASE WHEN ship_postal_code IS NULL THEN 1 ELSE 0 END) AS ship_postal_code_nulls ,
	SUM(CASE WHEN category IS NULL THEN 1 ELSE 0 END) AS category_nulls ,
	SUM(CASE WHEN total_amount IS NULL THEN 1 ELSE 0 END) AS total_amount_nulls ,
	SUM(CASE WHEN author IS NULL THEN 1 ELSE 0 END) AS author_nulls ,
	SUM(CASE WHEN "publication" IS NULL THEN 1 ELSE 0 END) AS publication_nulls ,
	SUM(CASE WHEN profit_percentage IS NULL THEN 1 ELSE 0 END) AS profit_percentage_nulls ,
	SUM(CASE WHEN profit_inr IS NULL THEN 1 ELSE 0 END) AS profit_inr_nulls ,
	SUM(CASE WHEN cost_price IS NULL THEN 1 ELSE 0 END) AS cost_price_nulls 
FROM sn_dynamo sd 	


-- QC03: Checking sum, min and max for columns (where it is appropiate)

-- QC03.1 - Checking sum, min and max for row_id
--        - Results: min = 1, max = 3480, sum = 6,056,940. Matches source.
SELECT 
	sum(id) ,
	min(id) ,
	max(id)
FROM
	sn_dynamo sd 


-- QC03.2 - Checking sum, min and max for qtr
--        - Results: min = 1, max = 4, sum = 8194. Matches source.
SELECT 
	sum(qtr) ,
	min(qtr) ,
	max(qtr)
FROM
	sn_dynamo sd 


-- QC03.3 - Checking sum, min and max for year
--        - Results: min = 2018, max = 2019, sum = 7,024,924. Matches source.
SELECT 
	sum("year") ,
	min("year") ,
	max("year")
FROM
	sn_dynamo sd 


-- QC03.4 - Checking sum, min and max for month
--        - Results: min = 1, max = 12, sum = 20,701. Matches source.
SELECT 
	sum("month") ,
	min("month") ,
	max("month")
FROM
	sn_dynamo sd 


-- QC03.5 - Checking sum, min and max for date_1
--        - Results: min = 1, max = 31, sum = 51,551. Matches source.
SELECT 
	sum(date_1) ,
	min(date_1) ,
	max(date_1)
FROM
	sn_dynamo sd 
	

-- QC03.6 - Checking sum, min and max for special_day
--        - Results: min = 0, max = 1, sum = 362. Matches source.
SELECT 
	sum(special_day) ,
	min(special_day) ,
	max(special_day)
FROM
	sn_dynamo sd 

	
-- QC03.7 - Checking sum, min and max for online_sale_offers
--        - Results: min = 0, max = 1, sum = 474. Matches source.
SELECT 
	sum(online_sale_offers) ,
	min(online_sale_offers) ,
	max(online_sale_offers)
FROM
	sn_dynamo sd 


-- QC03.8 - Checking sum, min and max for day
--        - Results: min = 1, max = 7, sum = 13,933. Matches source.	
SELECT 
	sum("day") ,
	min("day") ,
	max("day")
FROM
	sn_dynamo sd 
	
	
-- QC03.9 - Checking sum, min and max for weekend
--        - Results: min = 0, max = 1, sum = 344. Matches source.
SELECT 
	sum(weekend) ,
	min(weekend) ,
	max(weekend)
FROM
	sn_dynamo sd 


-- QC03.10 - Checking sum, min and max for morning
--        - Results: min = 0, max = 1, sum = 1107. Matches source.
SELECT 
	sum(morning) ,
	min(morning) ,
	max(morning)
FROM
	sn_dynamo sd 


-- QC03.11 - Checking sum, min and max for afternoon
--        - Results: min = 0, max = 1, sum = 971. Matches source.
SELECT 
	sum(afternoon) ,
	min(afternoon) ,
	max(afternoon)
FROM
	sn_dynamo sd 


-- QC03.12 - Checking sum, min and max for evening
--        - Results: min = 0, max = 1, sum = 611. Matches source.
SELECT 
	sum(evening) ,
	min(evening) ,
	max(evening)
FROM
	sn_dynamo sd 


-- QC03.13 - Checking sum, min and max for night
--        - Results: min = 0, max = 1, sum = 789. Matches source.
SELECT 
	sum(night) ,
	min(night) ,
	max(night)
FROM
	sn_dynamo sd 


-- QC03.14 - Checking sum, min and max for gender
--        - Results: min = 0, max = 1, sum = 1665. Matches source.
SELECT 
	sum(gender) ,
	min(gender) ,
	max(gender)
FROM
	sn_dynamo sd 


-- QC03.15 - Checking sum, min and max for quantity
--        - Results: min = 0, max = 10, sum = 3655. Matches source.
SELECT 
	sum(quantity) ,
	min(quantity) ,
	max(quantity)
FROM
	sn_dynamo sd 


-- QC03.16 - Checking sum, min and max for item_price
--        - Results: min = 40, max = 6450, sum = 1,314,521. Matches source.
SELECT 
	sum(item_price) ,
	min(item_price) ,
	max(item_price)
FROM
	sn_dynamo sd


-- QC03.17 - Checking sum, min and max for shipping_price
--        - Results: min = 0, max = 850, sum = 275,019. Matches source.
SELECT 
	sum(shipping_price) ,
	min(shipping_price) ,
	max(shipping_price)
FROM
	sn_dynamo sd

-- QC03.18 - Checking sum, min and max for total_amount
--        - Results: min = 80, max = 7300, sum = 1,589,599. Matches source.
SELECT 
	sum(total_amount) ,
	min(total_amount) ,
	max(total_amount)
FROM
	sn_dynamo sd


-- QC03.19 - Checking sum, min and max for profit_percentage
--        - Results: min = 13, max = 18, sum = 57,981. Matches source.
SELECT 
	sum(profit_percentage) ,
	min(profit_percentage) ,
	max(profit_percentage)
FROM
	sn_dynamo sd


-- QC03.20 - Checking sum, min and max for profit_inr
--        - Results: min = 5.2, max = 838.5, sum = 208139.17719999913. Matches source.
SELECT 
	sum(profit_inr) ,
	min(profit_inr) ,
	max(profit_inr)
FROM
	sn_dynamo sd


-- QC03.21 - Checking sum, min and max for cost_price
--        - Results: min = 34.8, max = 5611.5, sum = 1106422.6127999793. Matches source.
SELECT 
	sum(cost_price) ,
	min(cost_price) ,
	max(cost_price)
FROM
	sn_dynamo sd

	
-- QC04: Check string data 
-- QC04.1 - Check string data has same min and max length in each column
--        - Result: Matches source.
	/*      min_length_product_name: 7
			max_length_product_name: 154
			min_length_ship_city: 3
			max_length_ship_city: 49
			min_length_ship_state: 2
			max_length_ship_state: 25
			min_length_ship_pc: 6
			max_length_ship_pc: 6
			min_length_author: 3
			max_length_author: 45
			min_length_publication: 3
			max_length_publication: 58
	*/
	
SELECT 
	MIN(LENGTH(product_name)) AS min_length_product_name ,
	MAX(LENGTH(product_name)) AS max_length_product_name ,
	MIN(LENGTH(ship_city)) AS min_length_ship_city ,
	MAX(LENGTH(ship_city)) AS max_length_ship_city ,
	MIN(LENGTH(ship_state)) AS min_length_ship_state ,
	MAX(LENGTH(ship_state)) AS max_length_ship_state ,
	MIN(LENGTH(ship_postal_code)) AS min_length_ship_pc ,
	MAX(LENGTH(ship_postal_code)) AS max_length_ship_pc ,
	MIN(LENGTH(author)) AS min_length_author ,
	MAX(LENGTH(author)) AS max_length_author ,
	MIN(LENGTH("publication")) AS min_length_publication ,
	MAX(LENGTH("publication")) AS max_length_publication 
FROM
	sn_dynamo sd 


-- QC05: Check number of decimal places
	
-- QC05.1 - Check number of decimal places in profit_inr column
--        - Result: from eyeball check, results match source.
SELECT 
    id ,
	profit_inr ,
    CASE 
        WHEN profit_inr::text LIKE '%.%' THEN 
            LENGTH(SPLIT_PART(profit_inr::text, '.', 2))
        ELSE 
            0
    END AS decimal_places_count
FROM 
    sn_dynamo sd 
 

-- QC05.2 - Check number of decimal places in cost_price column
--        - Result: from eyeball check, results match source.
SELECT 
    id ,
	cost_price ,
    CASE 
        WHEN cost_price::text LIKE '%.%' THEN 
            LENGTH(SPLIT_PART(cost_price::text, '.', 2))
        ELSE 
            0
    END AS decimal_places_count
FROM 
    sn_dynamo sd 


-- QC06: Check subcategories
	
-- QC06.1 - Check subcategories in item_status column
--        - Result: Matches source.

SELECT 
	DISTINCT(item_status)
FROM 
	sn_dynamo sd 


-- QC06.2 - Check subcategories in category column
--        - Result: Matches source.
SELECT 
	DISTINCT(category)
FROM 
	sn_dynamo sd 


-- QC07: Special character check
	
-- QC07.1 - Check for any special characters and whether they show up properly in the product_name column
--        - Result: No characters that do not show up properly. Matches source.
SELECT 
	DISTINCT(product_name) AS product_name_sp,
	COUNT(product_name) AS count_product_name_sp
FROM sn_dynamo sd 
WHERE product_name ~ '[^a-zA-Z0-9\s''\-\()]'
GROUP BY product_name_sp
ORDER BY count_product_name_sp DESC;


-- QC07.2 - Check for any special characters and whether they show up properly in the ship_city column
--        - Result: No characters that do not show up properly. Matches source.
SELECT 
	DISTINCT(ship_city) AS ship_city_sp,
	COUNT(ship_city) AS count_ship_city_sp
FROM sn_dynamo sd 
WHERE ship_city ~ '[^a-zA-Z0-9\s''\-\()]'
GROUP BY ship_city_sp
ORDER BY count_ship_city_sp DESC;


-- QC07.3 - Check for any special characters and whether they show up properly in the ship_state column
--        - Result: No characters that do not show up properly. Matches source.
SELECT 
	DISTINCT(ship_state) AS ship_state_sp,
	COUNT(ship_state) AS count_ship_state_sp
FROM sn_dynamo sd 
WHERE ship_city ~ '[^a-zA-Z0-9\s''\-\()]'
GROUP BY ship_state_sp
ORDER BY count_ship_state_sp DESC;
