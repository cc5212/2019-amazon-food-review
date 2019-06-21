DEFINE CSVLoader org.apache.pig.piggybank.storage.CSVLoader();

raw_food_data = LOAD '/uhadoop2019/valdiejo/amazon-reviews.csv'  USING CSVLoader(',') AS (row_id: int, product_id: chararray, user_id: chararray, profile_name: chararray, num_help: int, den_help: int, score: int, time: datetime, summary: chararray, text: chararray);

quasi_cleaned_food_data = FILTER raw_food_data BY row_id IS NOT NULL;

cleaned_food_data = FOREACH quasi_cleaned_food_data GENERATE product_id, user_id, profile_name, num_help, den_help, score, time, summary, text;

/*
ProductId: Unique identifier for the product
UserId: Unique identifier of the user
ProfileName: Profile name of the user
HelpfulnessNumerator: Number of users who found the review helpful
HelpfulnessDenominator: Number of users who indicated whether they found the review helpful or not
score: rating between 1 and 5
Time: Timestamp for the review
Summary: Brief summary of the review
Text: Text of the review
 */

STORE cleaned_food_data INTO '/uhadoop2019/valdiejo/amazon_food_data' USING PigStorage('\t', 'schema');


/* To load the data use

food_data = LOAD '/uhadoop2019/valdiejo/amazon_food_data' USING PigStorage('\t', 'schema') AS (product_id: chararray, user_id: chararray, profile_name: chararray, num_help: int, den_help: int, score: int, time: datetime, summary: chararray, text: chararray);
*/

raw_product_data = LOAD '/uhadoop2019/valdiejo/amazon-products.csv'  USING CSVLoader(',') AS (product_id: chararray, date_added: chararray, date_updated: chararray, name: chararray, asins: chararray, brand: chararray, categories: chararray, primary_categories: chararray, image_urls: chararray, keys: chararray, manufacturer: chararray, manufacturer_number: chararray, review_date: chararray, review_date_seen: chararray, review_did_purchase: chararray, review_do_recommend: chararray, review_id: chararray, review_num_helpful: chararray, review_rating: chararray, review_source_urls: chararray, review_text: chararray, review_title: chararray, review_username: chararray, source_urls: chararray);

filtered_product_ids = FOREACH raw_product_data GENERATE product_id, name;

distinct_product_ids = DISTINCT filtered_product_ids;

STORE distinct_product_ids INTO '/uhadoop2019/valdiejo/product_name_data' USING PigStorage('\t', 'schema');

/* To load the data use

product_names = LOAD '/uhadoop2019/valdiejo/product_name_data' USING PigStorage('\t', 'schema') AS (product_id: chararray, name: chararray);
*/
