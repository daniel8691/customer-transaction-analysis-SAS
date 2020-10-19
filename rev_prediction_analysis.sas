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
