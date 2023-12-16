use Walmart;
-- ------------------------------------------------------------------------------------------------------------------------------------
											#Feature Engineering
#time_of_day
Select time,
		(case
			when `time` between "00:00:00" and "12:00:00" then "Morning"
			when `time` between "12:00:01" and "16:00:00" then "Afternoon"
			else "Evening"
        End) as time_of_date			
from Sales;
-- ------------------------------------------------------------------------------------------------------------------------------------
-- Day_Name
SELECT 
    date, DAYNAME(date)
FROM
    sales;
-- ------------------------------------------------------------------------------------------------------------------------------------
-- Month_Name
SELECT 
    date, MONTHNAME(date)
FROM
    sales;
-- ------------------------------------------------------------------------------------------------------------------------------------
										-- GENERIC QUESTIONS
#How many unique cities does the data have?
SELECT DISTINCT
    (City)
FROM
    sales;

# In which city is each branch?
SELECT DISTINCT
    (city), branch
FROM
    sales;
-- ------------------------------------------------------------------------------------------------------------------------------------
										-- Product
#How many unique product lines does the data have ?
SELECT 
    COUNT(DISTINCT product_line)
FROM
    sales;
-- ------------------------------------------------------------------------------------------------------------------------------------
# What is the most common payment method?
SELECT 
    payment_method, COUNT(payment_method) as total
FROM
    sales
GROUP BY payment_method
ORDER BY total DESC;
-- ------------------------------------------------------------------------------------------------------------------------------------
# What is the most selling product line?
SELECT 
    product_line, COUNT(product_line) AS total
FROM
    sales
GROUP BY product_line
ORDER BY total DESC;
-- ------------------------------------------------------------------------------------------------------------------------------------
# What is the total revenue by month?
SELECT 
    Month_name, SUM(total) AS Revenue
FROM
    sales
GROUP BY Month_Name
ORDER BY Revenue desc;

-- ------------------------------------------------------------------------------------------------------------------------------------
# Which month had the largest COGS?
SELECT 
    Month_name, SUM(cogs) AS Cogs
FROM
    sales
GROUP BY Month_Name
ORDER BY Cogs DESC;

-- ------------------------------------------------------------------------------------------------------------------------------------
# What product line has the largest revenue?
SELECT 
    product_line, SUM(total) AS Revenue
FROM
    sales
GROUP BY product_line
ORDER BY Revenue DESC;
-- ------------------------------------------------------------------------------------------------------------------------------------
# What is the city with the largest revenue?
SELECT 
    city, SUM(total) AS Revenue
FROM
    Sales
GROUP BY city
ORDER BY Revenue DESC; 
-- ------------------------------------------------------------------------------------------------------------------------------------
# What product line had the largest VAT?
SELECT 
    product_line, avg(VAT) AS VAT
FROM
    sales
GROUP BY product_line
ORDER BY VAT DESC;
-- ------------------------------------------------------------------------------------------------------------------------------------
# Fetch each product line and add column to those product line showing "Good", "Bad". Good if it's greater thab average rating

-- ------------------------------------------------------------------------------------------------------------------------------------
# Which branch sold more products than average product sold?
SELECT 
    branch, SUM(quantity) AS qty
FROM
    sales
GROUP BY branch
HAVING SUM(quantity) > (SELECT 
        AVG(quantity)
    FROM
        sales)
ORDER BY qty desc; 

-- ------------------------------------------------------------------------------------------------------------------------------------
# What is the most common product line by gender?
SELECT 
    gender, product_line, COUNT(gender) AS GN
FROM
    sales
WHERE
    gender
GROUP BY  gender, product_line
ORDER BY GN DESC;
-- ------------------------------------------------------------------------------------------------------------------------------------
# What is the average rating of each product line?
SELECT DISTINCT
    (product_line) AS PL, Round(AVG(ratings),1) AS Avg_Ratings
FROM
    sales
GROUP BY PL; 

-- ------------------------------------------------------------------------------------------------------------------------------------
#Number of sales made in each time of the day per weekday
SELECT 
    time_of_day, COUNT(*) AS total_count
FROM
    sales
WHERE
    day_name = 'Monday'
GROUP BY time_of_day;
-- --------------------------------------and--------------------------------
SELECT 
    day_name, time_of_day, COUNT(*) AS total_sales
FROM
    sales
GROUP BY day_name , time_of_day
ORDER BY total_sales DESC;
-- ------------------------------------------------------------------------------------------------------------------------------------
# Which city has the largest tax percentage?
SELECT 
    City, AVG(VAT) AS tax
FROM
    sales
GROUP BY city
ORDER BY tax DESC;
-- ------------------------------------------------------------------------------------------------------------------------------------
# Which customer types brings the most revenue?
SELECT 
    customer_type, SUM(total) AS Revenue
FROM
    sales
GROUP BY customer_type
ORDER BY Revenue DESC;
-- ------------------------------------------------------------------------------------------------------------------------------------
# Which customer types pays the most VAT?
SELECT 
    Customer_type, Round(AVG(VAT),2) AS Tax
FROM
    sales
GROUP BY Customer_type
ORDER BY Tax DESC;
-- ------------------------------------------------------------------------------------------------------------------------------------
# How many unique customer types does the data have?
SELECT DISTINCT
    (Customer_type)
FROM
    sales;
-- ------------------------------------------------------------------------------------------------------------------------------------
# How many unique payments types does the data have?
SELECT DISTINCT
    (payment_method)
FROM
    sales;
-- ------------------------------------------------------------------------------------------------------------------------------------
# What is the most common customer type?
SELECT 
    Customer_type AS Cust, COUNT(Customer_type) AS Total
FROM
    sales
GROUP BY Cust
ORDER BY Cust DESC;
-- ------------------------------------------------------------------------------------------------------------------------------------
# Which customer type buys the most?
SELECT 
    Customer_type, SUM(total) AS Buy_in_Rupees
FROM
    sales
GROUP BY Customer_type;
-- ------------------------------------------------------------------------------------------------------------------------------------
# What is the gender of most of the customers?
SELECT 
    gender, COUNT(gender) AS total
FROM
    sales
GROUP BY gender
ORDER BY total DESC;
-- ------------------------------------------------------------------------------------------------------------------------------------
# What is the gender distribution per branch?
SELECT 
    branch, gender, COUNT(gender) AS Total
FROM
    sales
GROUP BY branch , gender
ORDER BY branch;
-- ------------------------------------------------------------------------------------------------------------------------------------
# Which time of the day do customers give most ratings?
SELECT 
    time_of_day, ROUND(AVG(Ratings), 2) AS Avg_ratings
FROM
    sales
GROUP BY time_of_day
ORDER BY Avg_ratings;
-- ------------------------------------------------------------------------------------------------------------------------------------
# Which time of the day do customers give most rating per branch?
SELECT 
    branch, time_of_day, ROUND(AVG(Ratings), 2) AS Avg_ratings
FROM
    sales
GROUP BY branch , time_of_day
ORDER BY branch, Avg_ratings desc;
-- ------------------------------------------------------------------------------------------------------------------------------------
# Which day of the week has the best average ratings?
SELECT 
    day_name, ROUND(AVG(Ratings), 2) AS Avg_ratings
FROM
    sales
GROUP BY day_name
ORDER BY Avg_ratings DESC;
-- ------------------------------------------------------------------------------------------------------------------------------------
# Which day of the week has the best average rating per branch?
SELECT 
    branch, day_name, ROUND(AVG(Ratings), 2) AS Avg_ratings
FROM
    sales
GROUP BY branch, day_name
ORDER BY Avg_ratings DESC;
-- ------------------------------------------------------------------------------------------------------------------------------------
-- ------------------------------------------------------------------------------------------------------------------------------------

select * from Sales;
