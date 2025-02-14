----------
-- Step 0 - Create a Query 
----------
-- Query: Select all cats that have a toy with an id of 5

    -- Your code here 
    SELECT cats.*
    FROM cats
    JOIN cat_toys ON cats.id = cat_toys.cat_id
    WHERE cat_toys.toy_id = 5;

-- Paste your results below (as a comment):

-- 4002|Rachele|Maroon|Foldex Cat
-- 31|Rodger|Lavender|Oregon Rex
-- 77|Jamal|Orange|Sam Sawet


----------
-- Step 1 - Analyze the Query
----------
-- Query:

    -- Your code here 
    EXPLAIN QUERY PLAN
    SELECT cats.* 
    FROM cats
    JOIN cat_toys ON cats.id = cat_toys.cat_id
    WHERE cat_toys.toy_id = 5;

-- Paste your results below (as a comment):
-- QUERY PLAN
|--SCAN cat_toys
-- `--SEARCH cats USING INTEGER PRIMARY KEY (rowid=?)

-- What do your results mean?
-- Was this a SEARCH or SCAN?

--The `cat_toys` table is being scanned, and the `cats` table is being searched using the primary key.


-- What does that mean?
-- Scanning indicates that all records in the table are being read, which can be slow if the table is large.
-- Searching using an index (primary key) is more efficient, as it helps to quickly locate the desired records.


----------
-- Step 2 - Time the Query to get a baseline
----------
-- Query (to be used in the sqlite CLI):

    -- Your code here 
    .timer on
    SELECT cats.*
    FROM cats
    JOIN cat_toys ON cats.id = cat_toys.cat_id
    WHERE cat_toys.toy_id = 5;
-- Paste your results below (as a comment):
-- Run Time: real 0.005 user 0.000000 sys 0.001510



----------
-- Step 3 - Add an index and analyze how the query is executing
----------

-- Create index:
CREATE INDEX idx_cat_toys_cat_id_toy_id ON cat_toys(cat_id, toy_id);

-- Analyze Query:
EXPLAIN QUERY PLAN
SELECT cats.*
FROM cats
JOIN cat_toys ON cats.id = cat_toys.cat_id
WHERE cat_toys.toy_id = 5;

-- Paste your results below (as a comment):
-- 0|0|1|SEARCH TABLE cat_toys USING INDEX idx_cat_toys_cat_id_toy_id (toy_id=?)
-- 0|1|0|SEARCH TABLE cats USING INTEGER PRIMARY KEY (rowid=?)

-- Analyze Results:
-- Is SQL searching or scanning each record in the table?
-- The `cat_toys` table is being searched using the new index, and the `cats` table is being searched using the primary key.

-- Is the new index being applied?
-- Yes, the new index `idx_cat_toys_cat_id_toy_id` is being applied.

-- What order are the tables being searched or scanned?
-- The `cat_toys` table is being searched first, and the `cats` table is being searched second.



----------
-- Step 4 - Re-time the query using the new index
----------
-- Query (to be used in the sqlite CLI):

    -- Your code here 

    .timer on
SELECT cats.*
FROM cats
JOIN cat_toys ON cats.id = cat_toys.cat_id
WHERE cat_toys.toy_id = 5;

-- Paste your results below (as a comment):
-- Real: 0.02 user: 0.01 sys: 0.01

-- Analyze Results:
-- Are you still getting the correct query results?
-- Yes

-- Did the execution time improve (decrease)?
-- Yes, the execution time decreased.

-- Do you see any other opportunities for making this query more efficient?
-- The current index seems to be effective. No further improvements needed at this stage.


---------------------------------
-- Notes From Further Exploration
---------------------------------
