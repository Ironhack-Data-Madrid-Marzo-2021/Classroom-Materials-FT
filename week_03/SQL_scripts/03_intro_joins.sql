/* From looking at our ERD, we know that publishers and titles have a one-to-many relationship. Let's join them and get a count of the number of titles each publisher has published. */



/* Because we used an INNER JOIN for this query, it returns only results for publishers whose pub_id is in both tables. What if we wanted the results to return records for all the publishers, regardless of whether they had published any titles? This is exactly what a left join can help us with. All we need to do is replace our INNER JOIN with a LEFT JOIN and it will return all the records in the publishers table and count zero records for the ones that do not have any titles published.*/




/* What if we wanted to analyze how many units were sold for each title? We could declare our sales table first, our titles table second, and use a RIGHT JOIN to ensure that our query returns a record for every title (even the ones that did not have any sales).*/




/*
The command for an outer join is typically FULL OUTER JOIN. However, MySQL does not support full outer joins, so we must improvise and perform them using a combination of the LEFT JOIN, RIGHT JOIN, and UNION commands. The left and right joins will collectively return all the records from each of the joined tables. The UNION command combines the results of two queries, and it should be placed directly between them. For example, if we wanted to see what employees were assigned to which jobs, ensuring that the query returns both employees not assigned to a job and jobs not assigned to any employee, we would write our query as follows --- notice also that we can reference tables and columns as if they were attributes in Python classes :).
*/

