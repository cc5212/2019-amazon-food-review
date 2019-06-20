DEFINE CSVLoader org.apache.pig.piggybank.storage.CSVLoader();

raw_data = LOAD '/uhadoop2019/valdiejo/amazon-reviews.csv'  USING CSVLoader(',') AS (row_id: int, product_id: chararray, user_id: chararray, profile_name: chararray, num_help: int, den_help: int, score: int, time: datetime, summary: chararray, text: chararray);

quasi_cleaned_data = FILTER raw_data BY row_id IS NOT NULL;

cleaned_data = FOREACH quasi_cleaned_data GENERATE product_id, user_id, profile_name, num_help, den_help, score, time, summary, text;

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

STORE cleaned_data INTO '/uhadoop2019/valdiejo/stored_data' USING PigStorage('\t', 'schema');

/* To load the data use

data = LOAD '/uhadoop2019/valdiejo/stored_data' USING PigStorage('\t', 'schema');
*/
