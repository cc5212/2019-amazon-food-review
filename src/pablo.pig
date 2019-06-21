raw_data = LOAD '/uhadoop2019/valdiejo/amazon_food_data' USING PigStorage('\t') AS (product_id: chararray,user_id: chararray,profile_name: chararray,num_help: int, den_help:int,score:int,time:datetime,summary: chararray,text:chararray);
users_review = FOREACH raw_data GENERATE user_id,profile_name,score,text;
cris= FILTER users_review BY profile_name == 'Bigmac' AND score == 1;
cris_dis = DISTINCT cris;
cris_limit = LIMIT cris_dis 5;
DUMP cris_limit;