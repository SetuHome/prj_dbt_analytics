-- SQL Definition to create the silver layer Fact Table - Order Review Fact

{{ config(materialized='table') }}

WITH CTE_OrderReviews AS 
(
  Select 
  distinct 
  review_id as reviewid,
  order_id as orderid,
  review_score as review_score,
  upper(review_comment_title) as review_comment_title,
  upper(review_comment_message) as review_comment_message,
  review_creation_date as review_creation_date
  FROM 
  dbx_analytics.staging.stg_order_review_fact
)

Select * FROM CTE_OrderReviews