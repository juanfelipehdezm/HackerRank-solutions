/**
Query all columns for all American cities in the CITY table with populations larger than 100000. The CountryCode for America is USA.
**/
SELECT * FROM CITY 
WHERE CountryCode = "USA"
AND population = 100000;

/**Query all attributes of every Japanese city in the CITY table. The COUNTRYCODE for Japan is JPN.**/
SELECT * FROM CITY 
WHERE CountryCode = "JPN";

/**Query a list of CITY names from STATION for cities that have an even ID number. 
Print the results in any order, but exclude duplicates from the answer.**/
SELECT DISTINCT City_name FROM STATION
WHERE (ID%2) == 0;

/**Find the difference between the total number of CITY entries in the table and the number of distinct CITY entries in the table.**/
SELECT COUNT(City_name) - COUNT(DISTINCT City_name)
FROM STATION;

/**Query the two cities in STATION with the shortest and longest CITY names, as well as their respective lengths 
(i.e.: number of characters in the name). If there is more than one smallest or largest city, choose the one that comes first when ordered alphabetically.**/
(
  SELECT City_name,length(City_name)
  FROM STATION
  ORDER BY length(City_name),City_name
  LIMIT 1
)
UNION
(
  SELECT City_name, length(City_name)
  FROM STATION
  ORDER BY length(City_name) DESC,City_name
  LIMIT 1
);

/*Query the list of CITY names starting with vowels (i.e., a, e, i, o, or u) from STATION. Your result cannot contain duplicates.*/
SELECT DISTINCT CITY 
FROM STATION
WHERE CITY LIKE 'a%' OR CITY LIKE 'e%'
   OR CITY LIKE 'i%' OR CITY LIKE 'o%'
   OR CITY LIKE 'u%'
ORDER BY CITY;

/*Query the list of CITY names ending with vowels (a, e, i, o, u) from STATION. Your result cannot contain duplicates.*/
SELECT DISTINCT CITY FROM STATION
WHERE CITY REGEXP '[aeiou]$'; /*THIS IS IN MY SQL, may it works in others?*/

/*Query the list of CITY names from STATION which have vowels (i.e., a, e, i, o, and u) as both their first and last characters. Your result cannot contain duplicates.*/
SELECT DISTINCT CITY
FROM STATION 
WHERE LEFT(CITY,1) IN ('a','e','i','o','u')
AND RIGHT(CITY,1) IN ('a','e','i','o','u')
ORDER BY CITY;

/*Query the list of CITY names from STATION that do not start with vowels. Your result cannot contain duplicates.*/
SELECT DISTINCT CITY 
FROM STATION 
WHERE LEFT(CITY,1) NOT IN ('a','e','i','o','u');

/*Query the Name of any student in STUDENTS who scored higher than  Marks. Order your output by the last three characters of each name. 
If two or more students both have names ending in the same last three characters (i.e.: Bobby, Robby, etc.), secondary sort them by ascending ID.*/
SELECT Name
FROM STUDENTS
WHERE Marks > 75
ORDER BY RIGHT(Name,3),ID asc;

/*Write a query identifying the type of each record in the TRIANGLES table using its three side lengths. Output one of the following statements 
or each record in the table:

Equilateral: It's a triangle with 3 sides of equal length.
Isosceles: It's a triangle with 2 sides of equal length.
Scalene: It's a triangle with 3 sides of differing lengths.
Not A Triangle: The given values of A, B, and C don't form a triangle.

Values in the tuple (13,14,30) cannot form a triangle because the combined value of sides A and B is not larger than that of side .*/
SELECT CASE 
           WHEN (A+B) <= C OR (A+C) <= B OR (B+C) <= A THEN 'Not A Triangle'
           WHEN A = B AND B = C THEN 'Equilateral'
           WHEN A = B OR A = C OR B = C THEN 'Isosceles'
           ELSE 'Scalene'
       END AS type_of_triangule
FROM TRIANGLES;

/*Query the total population of all cities in CITY where District is California.*/
SELECT SUM(population)
FROM CITY
WHERE District = " California";

/*Query the average population for all cities in CITY, rounded down to the nearest integer.*/
SELECT ROUND(AVERAGE(population))
FROM CITY;

/*Samantha was tasked with calculating the average monthly salaries for all employees in the EMPLOYEES table, but did not realize her keyboard's 0 
key was broken until after completing the calculation. She wants your help finding the difference between her miscalculation (using salaries with any zeros removed),
and the actual average salary. Write a query calculating the amount of error (i.e.: actual-miscalculated average monthly salaries), and round it up to the next integer.*/

SELECT CEIL(AVG(SALARY)-AVG(REPLACE(SALARY,'0',''))) /*The CEIL function takes to the next int. it works on MY-SQL*/
FROM EMPLOYEES;                                      /*We replaced the 0 with "" to simulate the mistake made by samantha*/


/*We define an employee's total earnings to be their monthly (month*salary) worked, and the maximum total earnings to be the maximum total earnings for any employee in the Employee 
table. Write a query to find the maximum total earnings for all employees as well as the total number of employees who have maximum total earnings. 
Then print these values as 2 space-separated integers.*/

SELECT (months*salary) AS earnings, count(*)
FROM Employee
WHERE (months*salary) = 
    (
    SELECT MAX(months*salary)
    FROM Employee
    )
GROUP BY earnings;