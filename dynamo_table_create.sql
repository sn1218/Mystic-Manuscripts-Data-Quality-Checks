---------------------
-- Table creation
---------------------

CREATE TABLE student.sn_dynamo (
	ID INT NOT NULL PRIMARY KEY,
	purchase_date VARCHAR(50) ,
	"date" VARCHAR(50) ,
	"time" VARCHAR(50) ,
	"quarter" VARCHAR(50) ,
	qtr INT ,
	"year" INT ,
	"month" INT ,
	date_1 INT ,
	special_day INT ,
	online_sale_offers INT ,
	"day" INT ,
	weekend INT ,
	morning INT ,
	afternoon INT ,
	evening INT ,
	night INT ,
	gender INT ,
	customer_ID VARCHAR(50) ,
	gender_F_M VARCHAR(2) ,
	product_name VARCHAR(300) ,
	item_status VARCHAR(50) ,
	quantity INT ,
	currency VARCHAR(50) ,
	item_price FLOAT ,
	shipping_price FLOAT ,
	ship_city VARCHAR(300) ,
	ship_state VARCHAR(300) ,
	ship_postal_code VARCHAR(300) ,
	category VARCHAR(50) ,
	total_amount FLOAT ,
	author VARCHAR ,
	"publication" VARCHAR(300) ,
	profit_percentage FLOAT ,
	profit_INR FLOAT ,
	cost_price FLOAT
	)


SELECT *
FROM student.sn_dynamo sd 



--convert date and time columns to a Date and Timestamp respectively

ALTER TABLE sn_dynamo 
ALTER COLUMN "date" TYPE DATE 
USING TO_DATE("date", 'MM/DD/YYYY');


ALTER TABLE sn_dynamo 
ALTER COLUMN "time" TYPE TIME 
USING TO_TIMESTAMP("time", 'HH24:MI')::TIME ;

