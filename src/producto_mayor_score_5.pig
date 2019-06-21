DEFINE CSVLoader org.apache.pig.piggybank.storage.CSVLoader();
raw_data = LOAD '/uhadoop2019/valdiejo/amazon-reviews.csv'  USING CSVLoader(',') AS (row_id: int,product_id: chararray,user_id: chararray,profile_name: chararray,num_help: int, den_help:int,score:int,time:datetime,summary: chararray,text:chararray);
/* 
Id: row id
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

data = FOREACH raw_data GENERATE product_id as p_id, score as sc;
only_score_five = FILTER data BY sc == 5;
groups = GROUP only_score_five BY p_id;
review_count = FOREACH groups GENERATE  COUNT(only_score_five) AS count, group AS p_id;
ordered = ORDER review_count BY count DESC;
product = LIMIT ordered 1;
DUMP product;