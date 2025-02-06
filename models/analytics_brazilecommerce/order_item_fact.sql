-- SQL Definition to create the silver layer Fact Table - Order Item Fact

{{ config(materialized='table') }}

WITH CTE_OrderItems AS 
(
  Select 
  distinct 
  order_id as orderid,
  order_item_id as order_item_id,
  product_id as productid,
  seller_id as sellerid,
  shipping_limit_date as shipping_limit_date,
  price as price,
  freight_value as freight_value
  FROM 
  dbx_analytics.staging.stg_order_item_fact
)

Select * FROM CTE_OrderItems