# Inventory Management
## Project
In SUTD's ESD curriculumn, we are tasked under the Manufacturing and Service Operations (MSO) module to analyse a company's inventory management. Due to logistical constraints in light of the COVID-19 situation, we have decided to use a dataset from kaggle. 

## Task
The [Kaggle datase](https://www.kaggle.com/felixzhao/productdemandforecasting) contains historical product demand for a manufacturing company with footprints globally. The company provides the demand of thousands of products within dozens of product categories. There are three central warehouses to ship products within the region it is responsible for. By assigning arbitrary parameters, we approached this as an inventory management problem: how can we maximise the company’s revenue and minimise its inventory holding cost?

## Resources
The codes found above are contributed from Team 10 and contribute towards the end report. 
Code Link | Author | Remarks
--- | --- | ---
[Link](../master/2D_MSO.ipynb) | Lucas | Used to do stratified sampling on the different products, ensuring that each warehouse is equally represented
[Link](../master/Stats%202D%20-%20Regression.R) | Jing Da | Used for regression analysis for product demand and time (months)
[Link](../master/QQplot.R) | Yin Ling | Used to generate QQ plots to test normality of product demand 
[Link](../master/Newsvendormodel-analysis.xlsx) | Lucas | Used to generate the results of the newsvendor model
