
-- SQL Definition to create the silver layer Fact Table - Order Payment Fact

{{ config(materialized='table') }}


WITH CTE_OrderPayments AS 
(
  Select 
  distinct 
  order_id as orderid,
  payment_sequential as payment_sequential,
  upper(payment_type) as payment_type,
  payment_installments as payment_installments,
  payment_value as payment_value
  FROM 
  dbx_analytics.staging.stg_order_payment_fact
)

Select * FROM CTE_OrderPayments