raw_data = LOAD '/uhadoop2019/valdiejo/amazon_food_data' USING PigStorage('\t') AS (product_id: chararray,user_id: chararray,profile_name: chararray,num_help: int, den_help:int,score:int,time:datetime,summary: chararray,text:chararray);
users_review = FOREACH raw_data GENERATE user_id,profile_name,score,text;
aidan_hogan = FILTER users_review BY profile_name=='Aidan Hogan';
aidan_hogan_group = GROUP aidan_hogan ALL;
number = FOREACH aidan_hogan_group GENERATE COUNT(aidan_hogan);
DUMP number;
/*ahogan = FILTER users_review BY profile_name == 'ahogan' || profile_name == 'Ahogan';
aidan = FILTER users_review BY profile_name == 'Aidan';
hogan = FILTER users_review BY profile_name == 'Hogan';
