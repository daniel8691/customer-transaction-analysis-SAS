# Customer Transaction Analysis with SAS

## Objectives

#### Revenue
* Find the top 5 customers that are the most valuable to the company
* Identify the best selling products and how much profits they contribute
* Find sales for each region (provinces)
* Concentration level of profits 
  * Check to see if the company profits depends on important customers or some products. If we do, then there is a risk that these important customers/products suddenly stop doing business with us which will negatively affect our business. This section to help us determine this risk
  
#### Costs
* Largest shipping costs
  * Which goods are the most expensive to ship
* Average shipping costs by mode
* Which product has the highest product return rate?

## Findings



#### Shipping Costs by Mode
Delivery Truck have the highest shipping costs, costing $44.94 on average, while "Regular Air" and "Express Air" have very similar costs at $7.59 and 7.78 respectively. The company could promote the expressing shipping option more because the company can then charge a premium, at the same time the cost difference is not big on the company's side. 

#### Product Return Rate
I determined how many times each products were sold and returned by the customer. I did this by left joining returns and the sales table on the products feature and creating a new feature with calculations for the return rate. I found that a product called "Memorex 'Cool' 80 Minute CD-R Spindle, 25/Pack" was purchased 5 times and also retrurned 5 times so it would be a good idea to check with the supplier to find out if there are any product quality issues.

