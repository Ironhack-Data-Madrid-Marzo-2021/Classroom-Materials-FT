##########################################################
##########################################################
#
#            The SQL SELECT Statement
#		      			 (& Friends)
#
#                    \ (•◡•) /
#
##########################################################
##########################################################


###########
-- SELECT - FROM: https://www.mysqltutorial.org/mysql-select-statement-query-data.aspx


USE employees;

###########
-- SELECT - FROM: https://www.mysqltutorial.org/mysql-select-statement-query-data.aspx

# select specific columns from table


# select all columns from table   




###########
-- WHERE: https://www.mysqltutorial.org/mysql-where/

/* 
Allows us to specify conditions that the data we want to select
need to satisfy
*/

-- All employees named Hugo

    
-- All female employees


###########    
/*
In SQL there are many OPERATORS that are used to link
keywords and symbosl. Let´s have a look to the most 
frequent ones!
*/    
###########
-- AND: https://www.mysqltutorial.org/mysql-and/

-- All female employees named Hugo


###########
-- OR: https://www.mysqltutorial.org/mysql-or/

-- All employees that are either female or named Hugo

    
    
###########
-- Operator Precedence

# What is this query going to return??


/*
SQL rule: The operator AND takes precedence over the operator OR
			  If we want to override this behaviour, we must use parentheses.
*/



###########
-- IN / NOT IN: https://www.mysqltutorial.org/sql-in.aspx

# Retrieve all data for people named either: Hugo, Mark, Bojan, or Anneke


# A better option ("Python like")
SELECT *
FROM employees
WHERE first_name IN ('Hugo', 'Mark', 'Bojan','Anneke');

# Or, to do just the opposite


###########
-- LIKE / NOT LIKE: https://www.mysqltutorial.org/mysql-like/
/*
Query data based on a specified pattern
Syntax: expression LIKE pattern ESCAPE escape_character
(Notice that the patterns are not case sensitive)
*/

# The percentage ( % ) wildcard matches any string of zero or more characters. 
# (It can be seen as a substitute for a sequence of characters)

# Select all employees whose name starts with 'An'

    
# What will this do?


# And this?    



-- The underscore ( _ ) wildcard matches any single character--- but only one



# (NOT LIKE works just in the opposite way)

# Retrieve all data from employees not hired in the year 1990


    
/*
NOTE: *, %, _ are called "Wildcard Characters" 
*/


###########
-- BETWEEN - AND: https://www.mysqltutorial.org/mysql-between

# with dates


# It is equivalent to	

    
# with numeric types    


# with strings


    
###########
-- IS NOT NULL / IS NULL: https://www.mysqltutorial.org/mysql-is-null/
-- Just like pandas ʕ•ᴥ•ʔ
    
    
    
    

###########
-- Mathematical Comparison Operators

	# equals = (solo un igual, sintaxis SQL)
	# not equal <> or !=   (como en python)
	# greater than >
	# greater or equal than >=
	# less than <=
	# less than or equal  

-- EXERCISE: Retrieve all columns for female employes hired (strictly) after '2015-01-01'



###########
-- SELECT DISTINCT: https://www.mysqltutorial.org/mysql-distinct.aspx

    
# make clear you don´t want duplicates 

###########
-- Introduction to Aggregate Functions: https://www.mysqltutorial.org/mysql-aggregate-functions.aspx

/* 
An aggregate function performs a calculation on multiple rows and returns a single value.
Syntax: function_name(DISTINCT | ALL expression)
All aggregate functions IGNORE NULL values unless specified
*/    

# How many employees are there in our database? 
# hint: emp_no is the primary key of the table



# How many different names do we have in the table??

-- How many employes were born after 1965-01-01??
SELECT COUNT(*) # NOTE using * makes COUNT to include NULL values
FROM employees
WHERE
    birth_date >= '1965-01-01';
    
###########
-- ORDER BY: https://www.mysqltutorial.org/mysql-order-by/

# Order names in alphabetical order
# ASC is the default


# Use multiple fields


# MAX()


# AVG()


# Count the number of unique departments


###########
-- GROUP BY: https://www.mysqltutorial.org/mysql-group-by.aspx
# Does this sound familiar to you? ʕ•ᴥ•ʔ
/*
Syntax:
SELECT 
    c1, c2,..., cn, aggregate_function(ci)
FROM
    table
WHERE
    where_conditions
GROUP BY c1 , c2,...,cn
ORDER BY c1, c2, ...;
*/

# Count the number of times each name appears in the table employees
SELECT first_name, COUNT(first_name) # it is a good habit to include the column you are grouping by
FROM employees
GROUP BY first_name;  

# EXERCISE: Repeat the query but ordering the result in alphabetical order



###########
-- Using Aliases (AS): https://www.mysqltutorial.org/mysql-alias/

/* Used to rename a selection from your query to clarify the output*/

# Rename the COUNT(first_name) column

###### CONCAT

###########
-- HAVING: https://www.mysqltutorial.org/mysql-having.aspx

/*
Used frequently with GROUP BY, it specifies a filter condition for groups of rows or aggregates.
It works like a WHERE but inside a GROUP BY clause
Syntax:
SELECT 
    select_list
FROM 
    table_name
WHERE 
    search_condition
GROUP BY 
    group_by_expression
HAVING 
    group_condition;
ORDER BY
	 column_name(s)
	 
After HAVING, you can have a condition with an aggregate function,
while WHERE cannot use aggregate functions within its conditions
*/

# WHERE and HAVING equivalent:
SELECT 
    *
FROM
    employees
WHERE
    hire_date >= '2000-01-01';
    
SELECT 
    *
FROM
    employees
HAVING
    hire_date >= '2000-01-01';

# Example WHERE doesn´t work, HAVING does:

/*Extract all first names that appear more than 250 times in the Employees table.*/

	# WHERE doesn´t work:

SELECT 
    first_name, COUNT(first_name) as names_count
FROM
    employees
GROUP BY first_name
# HAVING|WHERE names_count > 250
ORDER BY first_name;


-- WHERE vs HAVING 

/*
WHERE allows us to set conditions that refer to subsets of individual rows.
These conditions are applied *before* reorganizing the output into groups.
It is not until this moment that the output can be further improved or filtered with a condition specified
in the HAVING clause.
*/

/*
From the subset of employees hired before 2015, (it applies to all rows --> WHERE)
Extract a list of all names that are encountered less than 250 times. (aggregate funct COUNT --> HAVING)
*/



###########
-- LIMIT: https://www.mysqltutorial.org/mysql-limit.aspx


# Show the employee numbers of the 10 highest paid employees 
