with cte1 as(
SELECT *,LAG(spend) OVER(partition by product_id) as prev_year_spend
FROM 
user_transactions)

select 
extract(year from transaction_date)as year,
product_id,
spend as curr_year_spend,
prev_year_spend
,
round(
case 
when prev_year_spend is NULL
then null 
else 
((spend-prev_year_spend)::numeric/prev_year_spend)*100
end
,2)as yoy_rate
FROM cte1
;
