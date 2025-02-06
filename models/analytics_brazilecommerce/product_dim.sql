-- SQL Definition to create the silver layer Dimension Table - Product

{{ config(materialized='table') }}

WITH CTE_Product AS 
(
  Select 
  distinct 
  p.product_id as productid,
  upper(pc.product_category_name_english) as product_category_name,
  p.product_length_cm as product_length,
  p.product_weight_g as product_weight,
  p.product_width_cm as product_width,
  p.product_height_cm as product_height
  FROM 
  dbx_analytics.staging.stg_product p
  INNER JOIN
  dbx_analytics.staging.stg_product_category pc
  on p.product_category_name = pc.product_category_name

)

Select * FROM CTE_Product