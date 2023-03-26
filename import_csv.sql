-- write your COPY statement to import a csv here
\i /Users/yanggezheng/NYU/juniorSpring/DMA/hw/homework06-yanggezheng/create_table.sql
copy avg_sat (dbn, school_name, number_of_sat_test_takers, sat_critical_reading_avg_score, sat_math_avg_score, sat_writing_avg_score) from '/tmp/2012_SAT_Results.csv' csv header NULL AS 'N/A';
select * from avg_sat limit 10;
\d avg_sat