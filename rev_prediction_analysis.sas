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