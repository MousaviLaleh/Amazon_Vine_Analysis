CREATE TABLE review_id_table (
  review_id TEXT PRIMARY KEY NOT NULL,
  customer_id INTEGER,
  product_id TEXT,
  product_parent INTEGER,
  review_date DATE -- this should be in the formate yyyy-mm-dd
);

-- This table will contain only unique values
CREATE TABLE products_table (
  product_id TEXT PRIMARY KEY NOT NULL UNIQUE,
  product_title TEXT
);

-- Customer table for first data set
CREATE TABLE customers_table (
  customer_id INT PRIMARY KEY NOT NULL UNIQUE,
  customer_count INT
);

-- vine table
CREATE TABLE vine_table (
  review_id TEXT PRIMARY KEY,
  star_rating INTEGER,
  helpful_votes INTEGER,
  total_votes INTEGER,
  vine TEXT,
  verified_purchase TEXT
);


select * from review_id_table limit 10;
select * from products_table limit 10;
select * from customers_table limit 10;
select * from vine_table limit 10;



-- Deliverable 2: Determine Bias of Vine Reviews

-- step 1
select * 
into votes_table
from vine_table
where total_votes >= 20

--  step 2
select *
into topVotes_table
from votes_table
where CAST(helpful_votes AS FLOAT)/CAST(total_votes AS FLOAT) >=0.5


--  step 3
select *
into paidProgram_table
from topVotes_table
where vine = 'Y'

--  step 4
select *
into unpaidProgram_table
from topVotes_table
where vine = 'N'


select * from paidProgram_table limit 10;


--  step 5
do $$
declare
   review_count integer;
   five_star_count integer;
   up_review_count integer;
   up_five_star_count integer;
begin
   -- select the number of films from the actor table
   select count(review_id)
   into review_count
   from paidProgram_table;
   
   select count(review_id)
   into five_star_count
   from paidProgram_table
   where star_rating = 5;
   
   select count(review_id)
   into up_review_count
   from unpaidProgram_table;
   
   select count(review_id)
   into up_five_star_count
   from unpaidProgram_table
   where star_rating = 5;
   
   
   -- show the number of films
   raise notice 'Paid Total Reviews: %', review_count;
   raise notice 'Paid 5-Star Reviews: %', five_star_count;
   raise notice 'Paid Five Star Percentage: %', (five_star_count::float / review_count::float) * 100;
   raise notice '------------------------------';
   raise notice 'Un-Paid Total Reviews: %', up_review_count;
   raise notice 'Paid 5-Star Reviews: %', up_five_star_count;
   raise notice 'Paid Five Star Percentage: %', (up_five_star_count::float / up_review_count::float) * 100;
end; $$;
	
