DEFINE CSVLoader org.apache.pig.piggybank.storage.CSVLoader();
raw_data = LOAD '/uhadoop2019/valdiejo/amazon-reviews.csv' USING CSVLoader(',') AS (row_id: int,product_id: chararray,user_id: chararray,profile_name: chararray,num_help: int, den_help:int,score:int,time:datetime,summary: chararray,text:chararray);
/*Product with the most score of 1*/
product_score = FOREACH raw_data GENERATE product_id,score;
DUMP product_score;