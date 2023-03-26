-- write your queries underneath each number:
 
-- 1. the total number of rows in the database
select count(*) from avg_sat;
-- 2. show the first 15 rows, but only display 3 columns (your choice)
select dbn, school_name, number_of_sat_test_takers from avg_sat limit 15;
-- 3. do the same as above, but chose a column to sort on, and sort in descending order
select dbn, school_name, number_of_sat_test_takers from avg_sat order by number_of_sat_test_takers desc limit 15;
-- 4. add a new column without a default value
alter table avg_sat add column total numeric;
-- 5. set the value of that new column
update avg_sat set total = sat_critical_reading_avg_score + sat_math_avg_score + sat_writing_avg_score;
-- 6. show only the unique (non duplicates) of a column of your choice
select distinct number_of_sat_test_takers from avg_sat;
-- 7.group rows together by a column value (your choice) and use an aggregate function to calculate something about that group
select left(dbn, 2), count(*) from avg_sat group by left(dbn, 2);
-- 8. now, using the same grouping query or creating another one, find a way to filter the query results based on the values for the groups
select left(dbn, 2), count(*) from avg_sat where left(dbn, 2)::numeric > 10 group by left(dbn, 2);
-- 9. write a comment about your query 9
    -- number of people taken the exam
    select sum(number_of_sat_test_takers) from avg_sat;
-- 10. write a comment about your query 10
    --average score of each school
    select avg(total) from avg_sat;
-- 11. write a comment about your query 11
    --the number of schools in each district
    select left(dbn, 2), count(*) from avg_sat group by left(dbn, 2);
-- 12. write a comment about your query 12
    --the average score of each students
    alter table avg_sat add column total_score numeric;
    update avg_sat set total_score = number_of_sat_test_takers*total;
    select sum(total_score)/sum(number_of_sat_test_takers) from avg_sat;
