SELECT 
extract(month from current.event_date)as month,
count(DISTINCT current.user_id) as monthly_active_users
FROM 
user_actions as current
join user_actions as previous
on current.user_id=previous.user_id
where extract(year from current.event_date)=2022
and extract(month from current.event_date)=7
and extract(year from previous.event_date)=2022
and extract(month from previous.event_date)=6
group by month;
