DEFINE CSVLoader org.apache.pig.piggybank.storage.CSVLoader();
raw_data = LOAD '/uhadoop2019/valdiejo/amazon-reviews.csv' USING CSVLoader(',') AS (row_id: int,product_id: chararray,user_id: chararray,profile_name: chararray,num_help: int, den_help:int,score:int,time:datetime,summary: chararray,text:chararray);
/*Product with the most score of 1*/
product_score = FOREACH raw_data GENERATE product_id,score;
product_score_one = FILTER product_score BY score == 1;
product_score_group = GROUP product_score_one BY product_id;
product_count = FOREACH product_score_group GENERATE group AS product_id, COUNT(product_score_one) AS count;
product_count_ordered = ORDER product_count BY count DESC;
product_limit = LIMIT product_count_ordered 5;
DUMP product_limit;