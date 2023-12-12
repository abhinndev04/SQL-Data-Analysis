#READ CARS DATA AND COUNT OF CARS 
SELECT * from car_dekho;
SELECT 
    COUNT(*)
FROM
    car_dekho;

-- The manager asked the employees how many cars will be available in 2023?
SELECT 
    COUNT(*)
FROM
    car_dekho
WHERE
    year = 2023;

-- The manager asked the employees How many cars is available in 2020, 2021, 2022?
SELECT 
    year, COUNT(*) AS Total_cars
FROM
    car_dekho
WHERE
    year IN (2020 , 2021, 2023)
GROUP BY year;

-- Clinet asked to print the total of all cars by year
SELECT 
    year, COUNT(*) as total_cars
FROM
    car_dekho
GROUP BY year;

-- How many diesel cars are there in 2022?
select count(*) from car_dekho where year = 2020 and fuel = 'Diesel';

-- How many petrol cars will be there?
select count(*) from car_dekho where year = 2020 and fuel = 'Petrol';

-- The manger told the employees to give a print of all the fuel cars(petrol, diesel and CNG) come by all year --
# Petrol
SELECT 
    year, COUNT(*)
FROM
    car_dekho
WHERE
    fuel = 'Petrol'
GROUP BY year;

# Diesel
SELECT 
    year, COUNT(*)
FROM
    car_dekho
WHERE
    fuel = 'Diesel'
GROUP BY year;

#CNG
SELECT 
    year, COUNT(*)
FROM
    car_dekho
WHERE
    fuel = 'CNG'
GROUP BY year;

-- Which year had more than 100 cars?
SELECT 
    year, COUNT(year) AS Total_cars
FROM
    car_dekho
GROUP BY year
HAVING COUNT(year) > 100;

-- All cars count between 2015 to 2023 
SELECT 
    year, COUNT(year)
FROM
    car_dekho
WHERE
    year IN (2015 , 2016,
        2017,
        2018,
        2019,
        2020,
        2021,
        2022,
        2023)
GROUP BY year;

-- All cars detail between 2015 t0 2023
SELECT 
    *
FROM
    car_dekho
WHERE
    year BETWEEN 2015 AND 2023;






