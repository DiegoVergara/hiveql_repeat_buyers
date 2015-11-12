
·········································································
drop table temp_test_format;
drop table test_format;
create table temp_test_format (col_value string);
LOAD DATA INPATH '/tmp/data/test_format1.csv' OVERWRITE INTO TABLE temp_test_format;
create table test_format(user_id int, merchant_id int,prob int);

insert overwrite table test_format  
SELECT  
  regexp_extract(col_value, '^(?:([^,]*)\,?){1}', 1) user_id,  
  regexp_extract(col_value, '^(?:([^,]*)\,?){2}', 1) merchant_id,  
  regexp_extract(col_value, '^(?:([^,]*)\,?){3}', 1) prob
from temp_test_format;
·········································································
drop table temp_train_format;
drop table train_format;
create table temp_train_format (col_value string);
LOAD DATA INPATH '/tmp/data/train_format1.csv' OVERWRITE INTO TABLE temp_train_format;
create table train_format(user_id int, merchant_id int,label int);

insert overwrite table train_format  
SELECT  
  regexp_extract(col_value, '^(?:([^,]*)\,?){1}', 1) user_id,  
  regexp_extract(col_value, '^(?:([^,]*)\,?){2}', 1) merchant_id,  
  regexp_extract(col_value, '^(?:([^,]*)\,?){3}', 1) label
from temp_train_format;
·········································································
drop table temp_user_info_format;
drop table user_info_format;
create table temp_user_info_format (col_value string);
LOAD DATA INPATH '/tmp/data/user_info_format1.csv' OVERWRITE INTO TABLE temp_user_info_format;
create table user_info_format(user_id int, age_range int,gender int);

insert overwrite table user_info_format  
SELECT  
  regexp_extract(col_value, '^(?:([^,]*)\,?){1}', 1) user_id,  
  regexp_extract(col_value, '^(?:([^,]*)\,?){2}', 1) age_range,  
  regexp_extract(col_value, '^(?:([^,]*)\,?){3}', 1) gender
from temp_user_info_format;
·········································································
drop table temp_user_log_format;
drop table user_log_format;
create table temp_user_log_format (col_value string);
LOAD DATA INPATH '/tmp/data/user_log_format1.csv' OVERWRITE INTO TABLE temp_user_log_format;
create table user_log_format (user_id int, item_id int, cat_id int, merchant_id int, 
               brand_id int, time_stamp int, action_type int);

insert overwrite table user_log_format  
SELECT  
  regexp_extract(col_value, '^(?:([^,]*)\,?){1}', 1) user_id,  
  regexp_extract(col_value, '^(?:([^,]*)\,?){2}', 1) item_id,  
  regexp_extract(col_value, '^(?:([^,]*)\,?){3}', 1) cat_id,
  regexp_extract(col_value, '^(?:([^,]*)\,?){4}', 1) merchant_id,
  regexp_extract(col_value, '^(?:([^,]*)\,?){5}', 1) brand_id,
  regexp_extract(col_value, '^(?:([^,]*)\,?){6}', 1) time_stamp,
  regexp_extract(col_value, '^(?:([^,]*)\,?){7}', 1) action_type
from temp_user_log_format;
........................................................................

FORMAT 2
........................................................................

drop table temp_test_format_2;
drop table test_format_2;
create table temp_test_format_2 (col_value string);
LOAD DATA INPATH '/tmp/test_format2.csv' OVERWRITE INTO TABLE temp_test_format_2;
create table test_format_2 (user_id int, age_range int, gender int, merchant_id int,
                          label int, activity_log string);

insert overwrite table test_format_2  
SELECT  
  regexp_extract(col_value, '^(?:([^,]*)\,?){1}', 1) user_id,  
  regexp_extract(col_value, '^(?:([^,]*)\,?){2}', 1) age_range,  
  regexp_extract(col_value, '^(?:([^,]*)\,?){3}', 1) gender,
  regexp_extract(col_value, '^(?:([^,]*)\,?){4}', 1) merchant_id,
  regexp_extract(col_value, '^(?:([^,]*)\,?){5}', 1) label,
  regexp_extract(col_value, '^(?:([^,]*)\,?){6}', 1) activity_log
from temp_test_format_2;

........................................................................

drop table temp_train_format_2;
drop table train_format_2;
create table temp_train_format_2 (col_value string);
LOAD DATA INPATH '/tmp/train_format2.csv' OVERWRITE INTO TABLE temp_train_format_2;
create table train_format_2 (user_id int, age_range int, gender int, merchant_id int,
                          label int, activity_log string);

insert overwrite table train_format_2  
SELECT  
  regexp_extract(col_value, '^(?:([^,]*)\,?){1}', 1) user_id,  
  regexp_extract(col_value, '^(?:([^,]*)\,?){2}', 1) age_range,  
  regexp_extract(col_value, '^(?:([^,]*)\,?){3}', 1) gender,
  regexp_extract(col_value, '^(?:([^,]*)\,?){4}', 1) merchant_id,
  regexp_extract(col_value, '^(?:([^,]*)\,?){5}', 1) label,
  regexp_extract(col_value, '^(?:([^,]*)\,?){6}', 1) activity_log
from temp_train_format_2;







