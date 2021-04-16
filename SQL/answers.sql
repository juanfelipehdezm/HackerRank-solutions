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
ORDER BY CITY