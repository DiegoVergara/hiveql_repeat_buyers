Create table join_table as
select
c.user_id as user_id,
b.age_range as age_range,
b.gender as gender,
c.item_id as item_id,
c.cat_id as cat_id,
c.merchant_id as merchant_id,
c.brand_id as brand_id,
c.time_stamp as time_stamp,
c.action_type as action_type,
a.label as label
from user_log_format c
left outer join 
user_info_format b on c.user_id = b.user_id
left outer join 
train_format a on (c.user_id = a.user_id and c.merchant_id = a.merchant_id)
;


..........................................................................................


SELECT user_id, age_range, gender, item_id, cat_id, merchant_id, brand_id,
time_stamp, action_type, label
FROM tabla_join;

.........................................................................................

Create table join_table_2 as
select
c.user_id as user_id,
b.age_range as age_range,
b.gender as gender,
c.merchant_id as merchant_id,
a.label as label,
b.activity_log as activity_log
from user_log_format c
left outer join 
user_info_format b on c.user_id = b.user_id
left outer join 
train_format a on (c.user_id = a.user_id and c.merchant_id = a.merchant_id)
;
