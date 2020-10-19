PROC IMPORT DATAFILE="/folders/myfolders/SAS Udemy/Revenue prediction case study/customers.xlsx"
			DBMS=xlsx
			OUT=customers
			REPLACE;
RUN;
PROC IMPORT DATAFILE="/folders/myfolders/SAS Udemy/Revenue prediction case study/products.xlsx"
			DBMS=xlsx
			OUT=products
			REPLACE;
RUN;
PROC IMPORT DATAFILE="/folders/myfolders/SAS Udemy/Revenue prediction case study/returns.xlsx"
			DBMS=xlsx
			OUT=returns
			REPLACE;
RUN;
PROC IMPORT DATAFILE="/folders/myfolders/SAS Udemy/Revenue prediction case study/sales.xlsx"
			DBMS=xlsx
			OUT=sales
			REPLACE;
RUN;

PROC PRINT DATA=customers (obs=10); RUN;
PROC PRINT DATA=products (obs=10);RUN;
PROC PRINT DATA= returns (obs=10);RUN;
PROC PRINT DATA=sales(obs=10);RUN;


/* Merge all datasets except returns into one single table */
PROC SQL;
CREATE TABLE complete_df AS
select c.*, p.*, s.*
from sales s
left join customers c ON s.customer_id = c.id
left join products p ON s.product_id = p.id
;QUIT;


/*
Find our top customers. Which customers bring in the most money 
to the company
*/
PROC SQL;
SELECT customer_name, sum(profit) as total_profit
FROM complete_df
GROUP BY customer_name
ORder BY profit DESC
;QUIT;

PROC PRINT DATA=profit_per_cust (obs=10);RUN;


/* Find the REGION DISTRIBUTION (provinces) of sales */
PROC SQL;
CREATE TABLE region_distribution AS
SELECT province, sum(Sales) as total_sales
FROM complete_df
GROUP BY province
ORDER BY total_sales DESC
;QUIT;

PROC PRINT DATA=region_distribution (obs=10);RUN;

/* Create a table showing the PERCENTAGE of the region distribution */
PROC SQL;
CREATE TABLE pct_distribution AS
SELECT province, total_sales, FORMAT((total_sales/sum(total_sales)),'P') as pct_sales
FROM region_distribution;
;QUIT;

PROC PRINT DATA = pct_distribution (obs=10);
FORMAT pct_sales percent10.2;
RUN;



/* Create a Pie chart visualizing the relationship */
proc template;
	define statgraph SASStudio.Pie;
		begingraph;
		entrytitle "Sum of Sales by Province" / textattrs=(size=14);
		layout region;
		piechart category=Province response= total_sales;
		endlayout;
		endgraph;
	end;
run;

ods graphics / reset width=6.4in height=4.8in imagemap;

proc sgrender template=SASStudio.Pie data=WORK.PCT_DISTRIBUTION;
run;

ods graphics / reset;


/* Calculate Concentration using the Herfindal index */
/* This measures the concentration in terms of contribution to the group */
/* The larger the measure, the more concentrated the group is */
/* First find profit earned for EACH CUSTOMER */
PROC SQL;
CREATE TABLE herfin AS
SELECT customer_name,sum(profit) as total_profit
FROM complete_df
GROUP BY customer_name
;QUIT;

/* Find the percentage of profits contributed for each customer */
PROC SQL;
CREATE TABLE herfin_pct AS
SELECT *, total_profit/sum(total_profit) as pct_profit
FROM herfin
;QUIT;

/* Square the numbers (profit) */
PROC SQL;
SELECT sum(pct_profit*pct_profit) as Herfindal, 1/count(*) as benchmark
FROM herfin_pct
;QUIT;

/*
The Herfindal level is higher than the benchmark (0.015032 to 0.00141)
 where every customer spend the same amount of money. The Herfindal
 level is much lower than the limit of 1 where a single customer
 represents all the revenue
 Conclusion: our profits are NOT concentrated to the customers and less
 affected by customer changes
 */


