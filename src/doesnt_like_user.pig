/*
User who doesn't like at avarage
*/
raw_data = LOAD '/uhadoop2019/valdiejo/amazon_food_data' USING PigStorage('\t') AS (product_id: chararray,user_id: chararray,profile_name: chararray,num_help: int, den_help:int,score:int,time:datetime,summary: chararray,text:chararray);
users_data = FOREACH raw_data GENERATE user_id,profile_name,score;
users_data_grouped = GROUP users_data BY user_id;
users_data_avarage_score = FOREACH users_data_grouped GENERATE AVG(users_data.score) AS avarage, group AS user_id;
sorted = ORDER users_data_avarage_score BY avarage ASC;
worst = LIMIT sorted 3;
DUMP worst;