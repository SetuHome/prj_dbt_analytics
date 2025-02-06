-- SQL Definition to create the silver layer Dimension Table - Geolocation

{{ config(materialized='table') }}

WITH CTE_Geolocation AS 
(
  Select 
  distinct 
  geolocation_zip_code_prefix as geolocation_zipcode,
  geolocation_lat as geolocation_lat,
  geolocation_lng as geolocation_lng,
  upper(geolocation_city) as geolocation_city,
  upper(geolocation_state) as geolocation_state
  FROM 
  dbx_analytics.staging.stg_geolocation
)

Select * FROM CTE_Geolocation