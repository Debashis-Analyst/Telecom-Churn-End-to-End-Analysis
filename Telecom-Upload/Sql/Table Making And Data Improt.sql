Create Database Telcom;
Use Telcom;


SET GLOBAL LOCAL_INFILE = ON; 

LOAD DATA LOCAL INFILE "C:/Users/iamra/Downloads/Telcom_Churn_Clean.csv" INTO TABLE telcom_churn
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 LINES ;



SHOW GLOBAL VARIABLES LIKE 'local_infile';

select * from telcom_churn 