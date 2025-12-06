create database covid;
use covid;

alter table ecdc_covid_19 rename to covid_19;
alter table covid_19 rename column dateRep to Date;
alter table covid_19 rename column countriesAndTerritories to Countries;
alter table covid_19 rename column month to Month;
alter table covid_19 rename column year to Year;
alter table covid_19 rename column day to Day;
alter table covid_19 rename column countryterritoryCode to Countrycode;
alter table covid_19 rename column popData2018 to Population;
alter table covid_19 rename column cases to Cases;
alter table covid_19 rename column deaths to Deaths;
alter table covid_19 rename column geoId to GeoId;
select * from covid_19;

# Problems

# Arithmetic Operators
select cases, deaths, cases + deaths as total_impact from covid_19;
select cases, deaths, cases - deaths as case_difference from covid_19;
select cases, population, cases * population as case_population_product from covid_19;
select cases, population, cases / population as case_ratio from covid_19;
select cases, cases % 10 as cases_mod_value from covid_19;
select cases, deaths, (cases + deaths) / 2 as avg_impact from covid_19;
select year, year - 2000 as years_passed from covid_19;
select month, day, (month * 30) + day as approx_day_of_year from covid_19;
select cases, cases * 1.1 as increased_cases from covid_19;
select population, cases, population / cases as people_per_case from covid_19;

# Logical Operators
select * from covid_19 where cases < 1000 and deaths < 50;
select * from covid_19 where cases > 500 or deaths > 20;
select * from covid_19 where not (cases = 0);
select * from covid_19 where month = 3 and day = 15;
select * from covid_19 where countrycodes = 'AGO' or countrycodes = 'AND';
select * from covid_19 where not (countrycodes = 'DZA');
select * from covid_19 where cases > 100 and not (deaths > 10);
select * from covid_19 where (cases > 1000 and deaths < 100) or population > 10000000;
select * from covid_19 where (year = 2020 and month = 2) and day between 1 and 15;
select * from covid_19 where (cases > deaths) and not (population < 500000);

# Special Operators

-- IN 
select * from covid_19 where countrycodes in ('afg', 'alb', 'and');
select * from covid_19 where month in (1, 2, 3);

-- NOT IN 
select * from covid_19 where countrycodes not in ('ind', 'pak');
select * from covid_19 where month not in (12, 1);

-- BETWEEN 
select * from covid_19 where cases between 100 and 1000;
select * from covid_19 where day between 10 and 20;

-- NOT BETWEEN 
select * from covid_19 where cases not between 50 and 200;
select * from covid_19 where day not between 5 and 15;

-- LIKE 
select * from covid_19 where countries like 'A%';
select * from covid_19 where countries like '%_nd__%';

-- NOT LIKE 
select * from covid_19 where countries not like 'i%';
select * from covid_19 where countries not like '%land';

-- IS NULL 
select * from covid_19 where deaths is null;
select * from covid_19 where geoId is null;

-- IS NOT NULL 
select * from covid_19 where cases is not null;
select * from covid_19 where population is not null;

-- EXISTS
select * from covid_19 c1 where exists (select 1 from covid_19 c2 where c2.cases < 1000);
select * from covid_19 c1 where exists (select 1 from covid_19 c2 where c2.countrycodes = 'afg');

-- ANY 
select * from covid_19 where cases > any (select cases from covid_19 where month = 3);
select * from covid_19 where deaths < any (select deaths from covid_19 where year = 2020);

-- ALL 
select * from covid_19 where cases > all (select cases from covid_19 where month = 1);
select * from covid_19 where deaths <= all (select deaths from covid_19 where countrycodes = 'alb');

-- DISTINCT and AS
select distinct countrycodes as unique_countrycodes from covid_19;
select distinct month as unique_months from covid_19;

# Aggregate Function

-- COUNT()
select count(*) as total_rows from covid_19;
select count(cases) as total_cases_records from covid_19;
select count(distinct countries) as total_countries from covid_19;

-- SUM()
select sum(cases) as total_cases from covid_19;
select sum(deaths) as total_deaths from covid_19;
select sum(population) as total_population from covid_19;

-- AVG()
select avg(cases) as avg_cases from covid_19;
select avg(deaths) as avg_deaths from covid_19;
select avg(population) as avg_population from covid_19;

-- MIN()
select min(cases) as min_cases from covid_19;
select min(deaths) as min_deaths from covid_19;
select min(population) as min_population from covid_19;

-- MAX()
select max(cases) as max_cases from covid_19;
select max(deaths) as max_deaths from covid_19;
select max(population) as max_population from covid_19;

# Order By
select * from covid_19 order by cases asc;
select * from covid_19 order by deaths desc;
select * from covid_19 order by countrycodes asc, cases desc;
select * from covid_19 order by population desc;
select * from covid_19 order by year asc, month asc, day asc;

# Case Statement
-- 1: categorize cases as low, medium, high
select cases,
case 
when cases < 100 then 'low'
when cases between 100 and 500 then 'medium'
else 'high'
end as case_category
from covid_19;

-- 2: mark death severity
select deaths,
case 
when deaths = 0 then 'no death'
when deaths between 1 and 50 then 'moderate'
else 'severe'
end as death_severity
from covid_19;

-- 3: identify pandemic phase based on month
select month,
case 
when month in (12, 1) then 'initial phase'
when month in (2, 3) then 'spread phase'
else 'unknown phase'
end as pandemic_phase
from covid_19;

-- 4: classify countries by population size
select countries, population,
case 
when population < 1000000 then 'small'
when population between 1000000 and 10000000 then 'medium'
else 'large'
end as population_category
from covid_19;

-- 5: highlight countries with high case impact
select countries, cases, deaths,
case 
when cases + deaths > 1000 then 'high impact'
else 'low impact'
end as impact_level
from covid_19;

-- extract year
select date, year(str_to_date(date, '%Y-%m-%d')) as year_extracted
from covid_19;

-- extract month number
select date, month(str_to_date(date, '%Y-%m-%d')) as month_extracted
from covid_19;

-- extract month name
select date, monthname(str_to_date(date, '%Y-%m-%d')) as month_name
from covid_19;

-- extract day number
select date, day(str_to_date(date, '%Y-%m-%d')) as day_extracted
from covid_19;

-- extract day name
select date, dayname(str_to_date(date, '%Y-%m-%d')) as day_name
from covid_19;
