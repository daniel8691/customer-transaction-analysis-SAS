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

#### Top customers 
The top 3 customers generated a total profit of $18k, 16k and 15k respectively while over 100 customers actually generate a negative profit because of product returns. The company could focus more on less profitable customers by giving promotions, or cut customers who are actaully costing the company money by creating issues or constantly return products. The top customers will buy from the company anyways, which is proven by their loyalty to the brand by buying more frequently than others.

#### Best selling categories
Office Machines, Tellephones, and Binders have the highest average profit among all the products while Tables and Bookcases have the lowest profits. The company can shift to selling product that have the highest margins and reduce product offerings that are losing money to reduce overhead costs.

#### Region Sales Distribution
Ontario and Alberta generated the highest percentage of sales of 18.42% and 11.62% respectively while New Brunswick and Northwest Territories generated the lowest amounts of sales of 4.19% and 5.14% respectively. The company could take advantage of the popularity in Ontario and Alberta to continue promoting in these regions to further increase sales, or find out why New Brunswick and Northwest Territories regions are performing poorly and find ways to improve these regions' performances. 

#### Cencentration level of profits for customers
Using the Herfindal index, I found The Herfindal level for the profit generated from each customer compared to the benchmark to be 0.015032 to 0.00141. The benchmark is calculated by dividing 1 by the number of customers there are on file, which would represent level where every customer spends the same amount of money. The Herfindal level of 0.015032 in this case, is much lower than the limit of 1, where a single customer represents all the revenue generated. This means that our profits are NOT concentrated to the customers and less affected by customer changes.

#### Concentration level of profits for products
The Herfindal level for the profit generated from each product compared to the benchmark to be 0.028762 to 0.000915. Again the benchmark number represents the level where every product generates the same profit for the company. The Herfindal level of 0.028762 is much lower than the limit of 1, where a single product represents all the profits generated, hence we can conclude that the company's profits are NOT concentrated to the top products and less affected if any changes happen to our products. 

#### Shipping Costs by Mode
Delivery Truck have the highest shipping costs, costing $44.94 on average, while "Regular Air" and "Express Air" have very similar costs at $7.59 and 7.78 respectively. The company could promote the expressing shipping option more because the company can then charge a premium, at the same time the cost difference is not big on the company's side. 
<br>

#### Product Return Rate
I determined how many times each products were sold and returned by the customer. I did this by left joining returns and the sales table on the products feature and creating a new feature with calculations for the return rate. I found that a product called "Memorex 'Cool' 80 Minute CD-R Spindle, 25/Pack" was purchased 5 times and also retrurned 5 times so it would be a good idea to check with the supplier to find out if there are any product quality issues.

