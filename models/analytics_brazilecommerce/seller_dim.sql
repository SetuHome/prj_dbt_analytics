
-- SQL Definition to create the silver layer Dimension Table - Seller

{{ config(materialized='table') }}

WITH CTE_Seller AS 
(
  Select 
  distinct 
  seller_id as sellerid,
  seller_zip_code_prefix as seller_zipcode,
  upper(seller_city) as seller_city,
  upper(seller_state) as seller_state
  FROM 
  dbx_analytics.staging.stg_seller
)

Select * FROM CTE_Seller