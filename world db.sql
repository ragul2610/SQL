              /*Task 1 - Display all rows from country table and calculate the number of rows in the table.
							             Display the country names and the population of the codes ('USA','GBR','ARE')*/
                                                                      
use world;

select count(name) from country;
-- Interpretaion - Total number of countries is found to be 239.

select name,population from country;
where code in ('USA','GBR','ARE');
-- Interpretation - Names of the countries and fopulation for the followuing code is shown.

   /*Task 2 - Display the continent names and sum of population of all countries in continents in descending order*/
 
select continent,sum(population) as total_population from country
group by continent
order by total_population desc; 
-- Interpretation - Continent wise total population is being found.

     /*Task 3 - Display the names of the countries of the European continent where language spoken is French*/
     
select name from country
where continent ='European'
and code in (select countrycode from countrylanguage
where language = 'French');
-- Interpretation - No continent of Europe doesnt have French as a country code.

    /*Task 4 - Display the name of the country wwith the highest population from each continent in database*/
    
select continent,name as country_name,population
from country
where(continent,population) in (select continent,max(population)
from country
group by continent);    
-- Interpretation - Continent wise country and its population is being listed in descending order of the population