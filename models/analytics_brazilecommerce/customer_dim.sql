
-- SQL Definition to create the silver layer Dimension Table - Customer

{{ config(materialized='table') }}

WITH CTE_Customer AS 
(
  Select 
  distinct 
  customer_id as customerid,
  customer_unique_id as customer_unique_id,
  customer_zip_code_prefix as customer_zipcode,
  upper(customer_city) as customer_city,
  upper(customer_state) as customer_state
  FROM 
  dbx_analytics.staging.stg_customer
)

Select * FROM CTE_Customer