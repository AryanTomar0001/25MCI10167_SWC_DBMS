with cte1 as
(SELECT 
*,
extract(month from submit_date)as month
FROM reviews
)

select 
month as mth ,
product_id as product,
round(
avg(stars)
,2)as avg_stars
from 
cte1 
group by product_id, month 
order BY
mth,product
