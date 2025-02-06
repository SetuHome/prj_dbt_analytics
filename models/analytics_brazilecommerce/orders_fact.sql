
-- SQL Definition to create the silver layer Fact Table - Orders    

{{ config(materialized='table') }}

WITH CTE_Orders AS 
(
  Select 
  distinct 
  order_id as orderid,
  customer_id as customerid,
  order_status as order_status,
  order_purchase_timestamp as order_purchase_time,
  order_approved_at as order_approved_time,
  order_delivered_carrier_date as order_delivered_carrier_date,
  order_delivered_customer_date as order_delivered_customer_date,
  order_estimated_delivery_date as order_estimated_delivery_date
  FROM 
  dbx_analytics.staging.stg_order_fact
)

Select * FROM CTE_Orders