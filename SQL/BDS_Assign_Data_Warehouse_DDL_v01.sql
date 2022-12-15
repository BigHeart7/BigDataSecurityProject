
CREATE TABLE PRODUCT_DIM(
	PRODUCT_DIM_KEY          int NOT NULL,
	PRODUCT_NBR              varchar(10) NOT NULL,
	PRODUCT_NAME             varchar(60) NULL,
	PRODUCT_STATUS_CODE      varchar(10) NULL)
;
ALTER TABLE PRODUCT_DIM
	ADD CONSTRAINT PK_PRODUCT_DIM PRIMARY KEY (PRODUCT_DIM_KEY)
;

CREATE TABLE CUSTOMER_DIM(
	CUSTOMER_DIM_KEY         int NOT NULL,
	CUSTOMER_NBR             varchar(10) NOT NULL,
	CUSTOMER_NAME            varchar(60) NULL,
	CUSTOMER_STATUS_CODE     varchar(10) NULL,
	LINE1_ADDR               varchar(60) NULL,
	LINE2_ADDR               varchar(60) NULL,
	CITY_NAME                varchar(60) NULL,
	POSTAL_CODE              varchar(10) NULL,
	STATE_PROVINCE_CODE      varchar(3) NULL,
	COUNTRY_CODE             varchar(3) NULL,
	EMAIL_ADDRESS            varchar(100) NULL,
	PHONE_NUMBER             varchar(32) NULL)
;
ALTER TABLE CUSTOMER_DIM
	ADD CONSTRAINT PK_CUSTOMER_DIM PRIMARY KEY (CUSTOMER_DIM_KEY)
;

CREATE TABLE CUSTOMER_INTEREST_FACT(
	CUSTOMER_DIM_KEY         int NOT NULL,
	PRODUCT_DIM_KEY          int NOT NULL,
    WISH_COUNT               int NOT NULL,
    PURCHASE_COUNT           int NOT NULL)
;	 
ALTER TABLE CUSTOMER_INTEREST_FACT
	ADD CONSTRAINT PK_CUSTOMER_INTEREST_FACT PRIMARY KEY (PRODUCT_DIM_KEY, CUSTOMER_DIM_KEY)
;

DELETE FROM public.customer_interest_fact;

DELETE FROM public.product_dim;

DELETE FROM public.customer_dim;

INSERT INTO public.product_dim
(product_dim_key, product_nbr, product_name, product_status_code)
VALUES
 (1001, 'PR-1001', 'Test Product One', 'ACTIVE')
,(1002, 'PR-1002', 'Test Product Two', 'ACTIVE') 
,(1003, 'PR-1003', 'Test Product Three', 'ACTIVE')
 ;

INSERT INTO public.customer_dim
(customer_dim_key, customer_nbr, customer_name, customer_status_code, line1_addr, line2_addr, city_name, postal_code, state_province_code, country_code, email_address, phone_number)
VALUES
 (2001, 'CU-2001', 'ANNE ABLE', 'ACTIVE', '1001 MAIN ST', 'SUIT 1001', 'FIRST CITY', '29680', 'SC', 'USA', '864-100-1001', 'anne.able@test.com')
,(2002, 'CU-2002', 'BEN E BEAR', 'ACTIVE', '1002 SECOND ST', 'SUIT 1002', 'SECOND CITY', '29680', 'SC', 'USA', '864-100-1002', 'ben.e.bear@test.com') 
,(2003, 'CU-2003', 'CAROL CAT', 'ACTIVE', '1003 THIRD ST', 'SUIT 1003', 'THIRD CITY', '29680', 'SC', 'USA', '864-100-1003', 'carol.cat@test.com') 
 ;
 
 
INSERT INTO public.customer_interest_fact
(customer_dim_key, product_dim_key, wish_count, purchase_count)
VALUES
  (2001, 1001, 1, 1)
 ,(2001, 1002, 1, 1)  
 ,(2001, 1003, 1, 1)
 ,(2002, 1001, 1, 1)
 ,(2002, 1002, 1, 1)  
 ,(2002, 1003, 1, 1)  
 ,(2003, 1001, 1, 1)
 ,(2003, 1002, 1, 1)  
 ,(2003, 1003, 1, 1) 
  ;

SELECT 'customer_interest_fact', count(*) FROM public.customer_interest_fact
UNION ALL
SELECT 'product_dim', count(*) FROM public.product_dim
UNION ALL
SELECT 'customer_dim', count(*) FROM public.customer_dim
ORDER BY 1;
