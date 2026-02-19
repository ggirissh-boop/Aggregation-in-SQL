use world;

## Question 1 : Count how many cities are there in each country?

select count(City_Name) as No_of_Cities, C.Country_Name
from country C
left join City Ci
on C.Country_Code = Ci.Countrycode
group by C.Country_Name
order by No_of_Cities desc;

## Question 2 : Display all continents having more than 30 countries.

select Continent, count(*) as CountryCount
from Country
group by Continent
having COUNT(*) > 30
order by CountryCount desc;

## Question 3 : List regions whose total population exceeds 200 million.

select sum(Country_Pop) as TotalPopulation, Region
from country
group by Region
Having TotalPopulation > 200000000
order by TotalPopulation Desc;

## Question 4 : Find the top 5 continents by average GNP per country.

select Continent, round(avg(GNP),2) as GNPperCountry
from country
group by Continent
order by GNPperCountry desc
limit 5;

## Question 5 : Find the total number of official languages spoken in each continent.

select count(IsOfficial) as OfficialLanguage,C.continent
from Country_Language CL
left join country C 
on Cl.CountryCode = C.Country_Code
where CL.IsOfficial = "T"
group by continent
order by OfficialLanguage desc;

## Question 6 : Find the maximum and minimum GNP for each continent.

select continent,
max(GNP) as MAXGNP,
min(GNP) as MINGNP
from country
group by continent
order by MAXGNP desc;

## Question 7 : Find the country with the highest average city population.

select C.Country_Name,round(avg(Ci.City_Pop),2) as HighestPop
from Country C
join City Ci
on C.Country_Code = Ci.CountryCode
group by Country_Name
order by HighestPop desc
limit 1;

SELECT c.Country_Name,
       (SELECT ci.City_Name
        FROM City ci
        WHERE ci.CountryCode = c.Country_Code
        ORDER BY ci.City_Pop DESC
        LIMIT 1) AS LargestCity,
       round(AVG(ci.City_Pop),2) AS HighestPopulation
FROM Country c
JOIN City ci ON c.Country_Code = ci.CountryCode
GROUP BY c.Country_Name, c.Country_Code
Having count(ci.City_Name) > 1
ORDER BY HighestPopulation DESC
LIMIT 1;

## Question 8 : List continents where the average city population is greater than 200,000.

select Continent, round(avg(city_Pop),2) as CityPOP
from country c
join City ci
on c.Country_Code = ci.Countrycode
group by Continent
having CityPOP > 200000
order by CityPOP desc;

## Question 9 : Find the total population and average life expectancy for each continent, ordered by average life expectancy descending.

select Continent,sum(Country_Pop) as TotalPopulation, round(avg(LifeExpectancy),2) as AvgLE
from country
group by Continent
order by AvgLE desc;

## Question 10 : Find the top 3 continents with the highest average life expectancy, but only include those where the total population is over 200 million.

select continent,round(avg(LifeExpectancy),2) as AvgLE,sum(Country_Pop) as TotalPopulation
from country
group by continent 
having TotalPopulation > 200000000
order by AvgLE desc
limit 3;

