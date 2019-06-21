DEFINE CSVLoader org.apache.pig.piggybank.storage.CSVLoader();
raw_data = LOAD '/uhadoop2019/valdiejo/amazon-reviews.csv'  USING CSVLoader(',') AS (row_id: int, product_id: chararray, user_id: chararray, profile_name: chararray, num_help: int, den_help: int, score: int, time: datetime, summary: chararray, text: chararray);
reviews = FOREACH raw_data GENERATE user_id,profile_name,num_help,den_help,score,text;
users_reviews = FOREACH reviews GENERATE profile_name,den_help-num_help AS helpness, text;
sorted_users_reviews = ORDER users_reviews BY helpness ASC;
worst_reviews_stuff = LIMIT sorted_users_reviews 3;
DUMP worst_reviews_stuff;
