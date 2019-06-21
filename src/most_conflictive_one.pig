food_data = LOAD '/uhadoop2019/valdiejo/amazon_food_data' USING PigStorage('\t', 'schema') AS (product_id: chararray, user_id: chararray, profile_name: chararray, num_help: int, den_help: int, score: int, time: datetime, summary: chararray, text: chararray);

/* 
ProductId: Unique identifier for the product
UserId: Unique identifier of the user
ProfileName: Profile name of the user
HelpfulnessNumerator: Number of users who found the review helpful
HelpfulnessDenominator: Number of users who indicated whether they found the review helpful or not
g: rating between 1 and 5
Time: Timestamp for the review
Summary: Brief summary of the review
Text: Text of the review
*/

grouped = GROUP data BY user_id;

counted = FOREACH grouped GENERATE COUNT($1) AS count, group;

DUMP counted;
