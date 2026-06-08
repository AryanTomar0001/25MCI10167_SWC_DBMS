SELECT 
count(*) as payment_count
FROM 
transactions as t1
join transactions as t2 
on 
t1.merchant_id=t2.merchant_id
and t1.credit_card_id =t2.credit_card_id
and t1.amount=t2.amount
AND t1.transaction_timestamp > t2.transaction_timestamp
AND t1.transaction_timestamp <= t2.transaction_timestamp + INTERVAL '10 minutes';
