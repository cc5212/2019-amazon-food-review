raw_data = LOAD '/uhadoop2019/valdiejo/amazon_food_data' USING PigStorage('\t') AS (product_id: chararray,user_id: chararray,profile_name: chararray,num_help: int, den_help:int,score:int,time:datetime,summary: chararray,text:chararray);
group_data = GROUP raw_data ALL;
count = FOREACH group_data GENERATE COUNT(raw_data) AS count;
DUMP count;