DEFINE CSVLoader org.apache.pig.piggybank.storage.CSVLoader();
raw_data = LOAD 'amazon-reviews.csv' USING CSVLoader(',') AS (row_id,product_id,user_id,profile_name,num_help, den_help,score,time,summary,text);
/* 
Id: row id
ProductId: Unique identifier for the product
UserId: Unique identifier of the user
ProfileName: Profile name of the user
HelpfulnessNumerator: Number of users who found the review helpful
HelpfulnessDenominator: Number of users who indicated whether they found the review helpful or not
Score: rating between 1 and 5
Time: Timestamp for the review
Summary: Brief summary of the review
Text: Text of the review
 */