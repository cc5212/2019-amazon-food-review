raw_data = LOAD '/uhadoop2019/valdiejo/amazon_food_data' USING PigStorage('\t') AS (product_id: chararray,user_id: chararray,profile_name: chararray,num_help: int, den_help:int,score:int,time:datetime,summary: chararray,text:chararray);
users_review = FOREACH raw_data GENERATE user_id,profile_name,score;
users_one_star = FILTER users_review BY score == 1;
users_grouped = GROUP users_one_star BY user_id;
users_count = FOREACH users_grouped GENERATE COUNT(users_one_star) AS count,group AS user_id;
users_count_with_name = JOIN users_count BY user_id, users_one_star BY user_id;
users_count_name = FOREACH users_count_with_name GENERATE profile_name AS profile_name,count AS count;
users_count_distinct = DISTINCT users_count_name;
users_count_sorted = ORDER users_count_distinct BY count DESC;
users_count_limit = LIMIT users_count_sorted 5;
DUMP users_count_limit;
/*users_count_sorted = ORDER users_count_name BY count ASC;

DUMP users_count_sorted;
/*
user_count_with_name = JOIN users_one_star BY user_id, users_count BY user_id;
users_count_name = FOREACH user_count_with_name GENERATE profile_name, count;
DUMP users_count_name;*/