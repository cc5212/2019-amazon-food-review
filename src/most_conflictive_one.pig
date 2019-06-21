food_data = LOAD '/uhadoop2019/valdiejo/amazon_food_data' USING PigStorage('\t', 'schema') AS (product_id: chararray, user_id: chararray, profile_name: chararray, num_help: int, den_help: int, score: long, time: datetime, summary: chararray, text: chararray);

/* 
product_id: Unique identifier for the product
user_id: Unique identifier of the user
profile_name: Profile name of the user
num_help: Number of users who found the review helpful
den_help: Number of users who indicated whether they found the review helpful or not
score: rating between 1 and 5
time: Timestamp for the review
summary: Brief summary of the review
text: Text of the review
*/

useful_food_data = FOREACH food_data GENERATE user_id, score;

grouped_by_user = GROUP useful_food_data BY user_id;

user_with_review =  FOREACH useful_food_data GENERATE user_id, score;

user_with_review_amount = FOREACH grouped_by_user GENERATE group AS user_id, COUNT(useful_food_data) AS amount;

user_with_review_sum = FOREACH grouped_by_user GENERATE group AS user_id, SUM(useful_food_data.score) AS sum;

user_with_review_amount_and_sum = JOIN user_with_review_amount BY user_id, user_with_review_sum BY user_id;

user_with_review_average_and_amount = FOREACH user_with_review_amount_and_sum GENERATE user_with_review_amount::user_id AS user_id, (user_with_review_sum::sum / user_with_review_amount::amount) AS average, user_with_review_amount::amount AS amount;

user_with_review_score_average_and_amount = JOIN user_with_review BY user_id, user_with_review_average_and_amount BY user_id;

user_with_normalized_squared_distances = FOREACH user_with_review_score_average_and_amount GENERATE user_with_review::user_id AS user_id, (((double)(user_with_review::score - user_with_review_average_and_amount::average) * (double)(user_with_review::score - user_with_review_average_and_amount::average)) / (double)user_with_review_average_and_amount::amount) AS normalized_squared_distance;

grouped_by_user_and_normalized_squared_distances = GROUP user_with_normalized_squared_distances BY user_id;

user_with_standard_deviation = FOREACH grouped_by_user_and_normalized_squared_distances GENERATE group AS user_id, SQRT((double)SUM(user_with_normalized_squared_distances.normalized_squared_distance)) AS standard_deviation;

user_with_standard_deviation_ordered = ORDER user_with_standard_deviation BY * DESC;

most_conflictive_user = LIMIT user_with_standard_deviation_ordered 1;

most_conflictive_user_data = JOIN most_conflictive_user BY user_id, food_data BY user_id;

most_conflictive_user_cleaned_data = FOREACH most_conflictive_user_data GENERATE most_conflictive_user::user_id AS user_id, most_conflictive_user::standard_deviation AS scores_standard_deviation, food_data::product_id AS product_id, food_data::profile_name AS profile_name, food_data::num_help AS num_help, food_data::den_help AS den_help, food_data::score AS score, food_data::time AS time, food_data::summary AS summary,food_data::text AS text;

STORE most_conflictive_user_cleaned_data INTO '/uhadoop2019/valdiejo/most_conflictive_user' USING PigStorage('\t', 'schema');

DUMP most_conflictive_user_cleaned_data;
