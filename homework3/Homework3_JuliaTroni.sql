Homework #3
Julia Troni Section 113


---------------------------------------- Question 1 Query ---------------------------------------- 

SELECT count(rental_rate) FROM film WHERE rental_rate = '4.99'; 

---------------------------------------- Question 1 Results ---------------------------------------- 					

 count 
-------
   336
(1 row)

---------------------------------------- Question 2 Query ---------------------------------------- 

SELECT last_name, first_name FROM customer WHERE active=0 ORDER BY last_name ASC;

---------------------------------------- Question 2 Results ---------------------------------------- 					
 last_name | first_name 
-----------+------------
 ARCE      | HARRY      
 COX       | JUDITH     
 CRAWLEY   | MAURICE    
 CULP      | THEODORE   
 EASTER    | BEN        
 EGGLESTON | JIMMIE     
 GOODEN    | KENNETH    
 JUNG      | CHRISTIAN  
 LARSON    | HEIDI
 MARTIN    | SANDRA
 MATTHEWS  | ERICA
 NEAL      | PENNY
 ROUSH     | TERRANCE
 RUNYON    | NATHAN
 WELLS     | SHEILA
(15 rows)
---------------------------------------- Question 3 Query ---------------------------------------- 

SELECT payment_id, amount, payment_date FROM payment ORDER BY amount DESC LIMIT 10; 

---------------------------------------- Question 3 Results ---------------------------------------- 					

 payment_id | amount |         payment_date
------------+--------+-------------------------------
      24866 |  11.99 | 2017-03-02 20:46:39.996577-07
      28814 |  11.99 | 2017-04-06 21:26:57.996577-06
      23757 |  11.99 | 2017-03-21 22:02:26.996577-06
      24553 |  11.99 | 2017-03-23 20:47:59.996577-06
      17354 |  11.99 | 2017-02-17 22:19:47.996577-07
      28799 |  11.99 | 2017-04-07 19:14:17.996577-06
      20403 |  11.99 | 2017-03-21 21:57:24.996577-06
      22650 |  11.99 | 2017-03-22 22:17:22.996577-06
      17055 |  11.99 | 2017-01-25 16:46:45.996577-07
      29136 |  11.99 | 2017-04-29 21:06:07.996577-06
(10 rows)

---------------------------------------- Question 4 Query ---------------------------------------- 
SELECT count(film.title) FROM language INNER JOIN film ON film.language_id = language.language_id WHERE language.name= 'English             ';

SELECT count(title) FROM film WHERE language_id = (SELECT language_id FROM language WHERE name= 'English             ');

---------------------------------------- Question 4 Results ---------------------------------------- 					
 count 
-------
  1000
(1 row)

 count 
-------
  1000
(1 row)

---------------------------------------- Question 5 Query ---------------------------------------- 

SELECT film.title FROM inventory INNER JOIN film ON film.film_id = inventory.film_id WHERE film.film_id = (SELECT film_id FROM inventory GROUP BY film_id ORDER BY COUNT (*) DESC LIMIT 1) LIMIT 1;

---------------------------------------- Question 5 Results ---------------------------------------- 					
     title     
---------------
 GARDEN ISLAND
(1 row))

---------------------------------------- Question 6 Query ---------------------------------------- 

SELECT customer_id, SUM(amount) AS Total_Amount FROM payment WHERE customer_id >500 GROUP BY customer_id ORDER BY customer_id ASC;


---------------------------------------- Question 6 Results ---------------------------------------- 					

 customer_id | total_amount 
-------------+--------------
         501 |        89.79 
         502 |       138.66 
         503 |       115.68 
         504 |       133.72 
         505 |        97.79 
         506 |       152.65 
         507 |        95.75 
         508 |       127.75 
         509 |       100.80 
         510 |       122.74 
         511 |        99.76 
         512 |       115.74 
         513 |       148.69 
         514 |        74.78 
         515 |       126.72 
         516 |        98.74 
         517 |       105.75 
         518 |       111.74 
         519 |       103.77 
         520 |       134.68
         521 |        80.77
         522 |       167.67
         523 |        93.78
         524 |        87.81
         525 |        74.81
         526 |       221.55
         527 |        81.76
         528 |       111.75
         529 |       118.71
         530 |        76.77
         531 |       118.75
         532 |       152.68
         533 |       141.67
         534 |        88.76
         535 |       135.68
         536 |       117.75
         537 |       103.75
         538 |       117.71
         539 |        90.78
         540 |       112.76
         541 |       108.76
         542 |        94.82
         543 |        82.78
         544 |        98.78
         545 |        89.79
         546 |       107.74
         547 |        99.77
         548 |        79.81
         549 |        77.80
         550 |       159.68
         551 |        96.74
         552 |        90.79
         553 |       107.76
         554 |       101.78
         555 |        74.83
         556 |        83.79
         557 |        73.76
         558 |       135.72
         559 |       110.72
         560 |       132.70
         561 |        96.73
         562 |       109.75
         563 |       110.71
         564 |        91.76
         565 |       126.71
         566 |       141.66
         567 |        85.80
         568 |        66.79
         569 |       134.68
         570 |        99.74
         571 |       121.76
         572 |       108.75
         573 |       120.71
         574 |       109.72
         575 |       126.71
         576 |       139.66
         577 |       118.72
         578 |        96.78
         579 |       111.73
         580 |        99.73
         581 |       107.73
         582 |       113.75
         583 |       117.77
         584 |       129.70
         585 |       117.76
         586 |        64.81
         587 |       108.74
         588 |       115.71
         589 |       129.72
         590 |       112.75
         591 |       134.73
         592 |       111.71
         593 |       113.74
         594 |       130.73
         595 |       117.70
         596 |        96.72
         597 |        99.75
         598 |        83.78
         599 |        83.81
(99 rows)

---------------------------------------- Question 7 Query ---------------------------------------- 
SELECT SUM(payment.amount) FROM payment 
INNER JOIN rental ON payment.rental_id = rental.rental_id 
INNER JOIN inventory ON inventory.inventory_id = rental.inventory_id 
INNER JOIN film on film.film_id = inventory.film_id 
INNER JOIN film_category ON film.film_id = inventory.film_id 
INNER JOIN category ON category.category_id = film_category.category_id GROUP BY film_category.category_id;

---------------------------------------- Question 7 Results ---------------------------------------- 					
 sum
------------
 3842741.07
 4112407.11
 4044990.60
 4112407.11
 4179823.62
 4247240.13
 4921405.23
 4314656.64
 3910157.58
 4449489.66
 3842741.07
 4988821.74
 4584322.68
 3438242.01
 4651739.19
 3775324.56
(16 rows)


---------------------------------------- Question 8 Query ---------------------------------------- 

SELECT count(rental.rental_date) FROM rental 
INNER JOIN customer ON customer.customer_id=rental.customer_id
WHERE customer.first_name= 'JOHN' AND customer.last_name= 'FARNSWORTH';

---------------------------------------- Question 8 Results ---------------------------------------- 					

 count 
-------
    31
(1 row)

---------------------------------------- Question 9 Query ---------------------------------------- 
SELECT count(*) FROM payment WHERE payment_date <= '2017-01-27';

---------------------------------------- Question 9 Results ---------------------------------------- 					

 count 
-------
   328
(1 row)

---------------------------------------- Question 10 Query ---------------------------------------- 

CREATE TABLE short_films (
  film_id INT NOT NULL PRIMARY KEY,
  title VARCHAR(40) NOT NULL,
  length INT NOT NULL,
  replacement_cost decimal(9,2) NOT NULL,
  rating VARCHAR(5) NOT NULL
);
	
---------------------------------------- Question 11 Query ---------------------------------------- 
INSERT INTO short_films (film_id, title, length,
  replacement_cost, rating)
  SELECT film_id, title, length,
  replacement_cost, rating FROM film WHERE length < 50;


---------------------------------------- Question 12 Query ---------------------------------------- 

DELETE FROM short_films WHERE replacement_cost > 19.99;

---------------------------------------- Question 13 Query ---------------------------------------- 

ALTER TABLE short_films
ADD stars INT 
DEFAULT 5;

---------------------------------------- Question 14 Query ---------------------------------------- 

ALTER TABLE short_films
RENAME COLUMN length TO length_min;

ALTER TABLE short_films
ADD COLUMN length_sec INT;

UPDATE short_films
SET length_sec = length_min*60;

---------------------------------------- Question 15 Query ---------------------------------------- 

DROP TABLE short_films;


