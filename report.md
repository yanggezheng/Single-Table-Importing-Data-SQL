# Overview
1. Name / Title: 2012 SAT Results
2. Link to Data: https://data.cityofnewyork.us/Education/2012-SAT-Results/f9bf-2cp4
3. Source / Origin: 
	* Author or Creator: Department of Education (DOE)
	* Publication Date: February 20, 2013
	* Publisher: NYC OpenData
	* Version or Data Accessed: 1.0
4. License: CC0: Public Domain
5. Can You Use this Data Set for Your Intended Use Case? Yes
* Format: csv
* Size: 28k
* Number of Records: 478
* Field/Column 1: dbn text,
* Field/Column 2: school_name text,
* Field/Column 3: number_of_sat_test_takers numeric,
* Field/Column 4: sat_critical_reading_avg_score numeric,
* Field/Column 5: sat_math_avg_score numeric,
* Field/Column 6: sat_writing_avg_score numeric


# Table Design
I set the type to be all text, because the missing values were replaced with 's'. And I set a constraint to the school name (not null)
dbn is the district number and school number (text)
school_name name of the school (text)
sat_critical_reading_avg_score the score of SAT part 1 (text)
sat_math_avg_score the score of SAT part 2 (text)
sat_writing_avg_score the score of SAT part 3 (text)


# Import
I have encountered an error where the relative path does not work. I copied the file to /tmp and used the absolute path. The problem was solved

# Database Information
postgres=# \l
                                  List of databases
    Name    |    Owner    | Encoding | Collate | Ctype |      Access privileges      
------------+-------------+----------+---------+-------+-----------------------------
 dmasp23    | yanggezheng | UTF8     | C       | C     | 
 homework06 | yanggezheng | UTF8     | C       | C     | 
 postgres   | yanggezheng | UTF8     | C       | C     | 
 template0  | yanggezheng | UTF8     | C       | C     | =c/yanggezheng             +
            |             |          |         |       | yanggezheng=CTc/yanggezheng
 template1  | yanggezheng | UTF8     | C       | C     | =c/yanggezheng             +
            |             |          |         |       | yanggezheng=CTc/yanggezheng
(5 rows)

postgres=# \c homework06
You are now connected to database "homework06" as user "yanggezheng".

homework06=# \d avg_sat
                         Table "public.avg_sat"
             Column             | Type | Collation | Nullable | Default 
--------------------------------+------+-----------+----------+---------
 dbn                            | text |           | not null | 
 school_name                    | text |           | not null | 
 number_of_sat_test_takers      | text |           |          | 
 sat_critical_reading_avg_score | text |           |          | 
 sat_math_avg_score             | text |           |          | 
 sat_writing_avg_score          | text |           |          | 
Indexes:
    "avg_sat_pkey" PRIMARY KEY, btree (dbn)


# Query Results
```
### 1. the total number of rows in the database
homework06-# ;
 count 
-------
   478
(1 row)

```
```
### 2. show the first 15 rows, but only display 3 columns (your choice)
homework06=# select dbn, school_name, number_of_sat_test_takers from avg_sat limit 15;
  dbn   |                          school_name                           | number_of_sat_test_takers 
--------+----------------------------------------------------------------+---------------------------
 01M292 | HENRY STREET SCHOOL FOR INTERNATIONAL STUDIES                  |                        29
 01M448 | UNIVERSITY NEIGHBORHOOD HIGH SCHOOL                            |                        91
 01M450 | EAST SIDE COMMUNITY SCHOOL                                     |                        70
 01M458 | FORSYTH SATELLITE ACADEMY                                      |                         7
 01M509 | MARTA VALLE HIGH SCHOOL                                        |                        44
 01M515 | LOWER EAST SIDE PREPARATORY HIGH SCHOOL                        |                       112
 01M539 | NEW EXPLORATIONS INTO SCIENCE, TECHNOLOGY AND MATH HIGH SCHOOL |                       159
 01M650 | CASCADES HIGH SCHOOL                                           |                        18
 01M696 | BARD HIGH SCHOOL EARLY COLLEGE                                 |                       130
 02M047 | 47 THE AMERICAN SIGN LANGUAGE AND ENGLISH SECONDARY SCHOOL     |                        16
 02M288 | FOOD AND FINANCE HIGH SCHOOL                                   |                        62
 02M294 | ESSEX STREET ACADEMY                                           |                        53
 02M296 | HIGH SCHOOL OF HOSPITALITY MANAGEMENT                          |                        58
 02M298 | PACE HIGH SCHOOL                                               |                        85
 02M300 | URBAN ASSEMBLY SCHOOL OF DESIGN AND CONSTRUCTION, THE          |                        48
(15 rows)
```
```
### 3. do the same as above, but chose a column to sort on, and sort in descending order
homework06=# select dbn, school_name, number_of_sat_test_takers from avg_sat order by number_of_sat_test_takers desc limit 15;
  dbn   |                             school_name                              | number_of_sat_test_takers 
--------+----------------------------------------------------------------------+---------------------------
 13K430 | BROOKLYN TECHNICAL HIGH SCHOOL                                       |                      1277
 26Q430 | FRANCIS LEWIS HIGH SCHOOL                                            |                       934
 26Q415 | BENJAMIN N. CARDOZO HIGH SCHOOL                                      |                       888
 02M475 | STUYVESANT HIGH SCHOOL                                               |                       832
 22K405 | MIDWOOD HIGH SCHOOL                                                  |                       824
 31R455 | TOTTENVILLE HIGH SCHOOL                                              |                       807
 28Q440 | FOREST HILLS HIGH SCHOOL                                             |                       762
 10X445 | BRONX HIGH SCHOOL OF SCIENCE                                         |                       731
 21K525 | EDWARD R. MURROW HIGH SCHOOL                                         |                       727
 26Q495 | BAYSIDE HIGH SCHOOL                                                  |                       708
 20K490 | FORT HAMILTON HIGH SCHOOL                                            |                       694
 25Q425 | JOHN BOWNE HIGH SCHOOL                                               |                       558
 31R460 | SUSAN E. WAGNER HIGH SCHOOL                                          |                       535
 03M485 | FIORELLO H. LAGUARDIA HIGH SCHOOL OF MUSIC & ART AND PERFORMING ARTS |                       531
 22K425 | JAMES MADISON HIGH SCHOOL                                            |                       518
(15 rows)

```
```
### 4. add a new column without a default value
ALTER TABLE

```
```
### 5. set the value of that new column
UPDATE 478

```
```
###
6. show only the unique (non duplicates) of a column of your choice
 number_of_sat_test_takers 
---------------------------
                        29
                        14
                        74
                        91
                        64
                       174
                       189
                        52
                       264
                        37
                        77
                        84
                       475
                       391
                       142
                       112
                        92
                        18
                       148
                       396
                       694
                       134
                       558
                       448
                       259
                        60
                        31
                       278
                        23
                       422
                        26
                       127
                        24
                        47
                        51
                       138
                       119
                        48
                      1277
                       404
                        57
                        72
:
```
```
###
7.group rows together by a column value (your choice) and use an aggregate function to calculate something about that group
 left | count 
------+-------
 75   |     7
 13   |    18
 18   |    14
 31   |    12
 09   |    22
 10   |    28
 29   |    10
 04   |     7
 28   |    14
 01   |     9
 23   |     6
 14   |    16
 02   |    65
 26   |     5
 32   |     7
 08   |    21
 06   |    11
 79   |     3
 07   |    17
 03   |    17
 22   |     5
 24   |    15
 11   |    19
 12   |    18
 15   |    13
 21   |    13
 17   |    20
 19   |    14
 20   |     6
 25   |    11
 30   |     9
 27   |    11
 05   |    10
 16   |     5
(34 rows)
```
```
###
8. now, using the same grouping query or creating another one, find a way to filter the query results based on the values for the groups
 left | count 
------+-------
 75   |     7
 13   |    18
 18   |    14
 32   |     7
 31   |    12
 11   |    19
 12   |    18
 15   |    13
 29   |    10
 21   |    13
 17   |    20
 22   |     5
 28   |    14
 19   |    14
 23   |     6
 20   |     6
 25   |    11
 14   |    16
 79   |     3
 30   |     9
 27   |    11
 24   |    15
 16   |     5
 26   |     5
(24 rows)
```
```
###
9.number of people taken the exam
  sum  
-------
 46445
(1 row)

```
```
###
10.average score of each school
 total 
-------
     0
  1122
  1172
  1149
  1174
  1207
  1205
  1621
  1246
  1856
  1182
  1194
  1156
  1111
  1293
  1269
  1051
  1148
  1200
  1188
(20 rows)
```
```
###
11.the number of schools in each district
 left | count 
------+-------
 75   |     7
 13   |    18
 18   |    14
 31   |    12
 09   |    22
 10   |    28
 29   |    10
 04   |     7
 28   |    14
 01   |     9
 23   |     6
 14   |    16
 02   |    65
 26   |     5
 32   |     7
 08   |    21
 06   |    11
 79   |     3
 07   |    17
 03   |    17
 22   |     5
 24   |    15
 11   |    19
 12   |    18
 15   |    13
 21   |    13
 17   |    20
 19   |    14
 20   |     6
 25   |    11
 30   |     9
 27   |    11
 05   |    10
 16   |     5
(34 rows)
```
```
###
12.the average score of each students
       ?column?        
-----------------------
 1326.6839487565938206
(1 row)
