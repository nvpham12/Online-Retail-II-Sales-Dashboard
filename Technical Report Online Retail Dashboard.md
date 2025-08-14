# Project Overview
This project leverages Google BigQuery to prepare data before loading it into Tableau to build a dashboard. Queries were later consolidated into a single query, then optimized to improve performance and reduce costs. 
For technical details on the data preparation, refer to the SQL files in the queries folder.
View the dashboard [here](https://public.tableau.com/views/RetailSalesDashboard_17545186499380/Dashboard?:language=en-US&:sid=&:redirect=auth&:display_count=n&:origin=viz_share_link).

# Tools & Technologies
- **Microsoft Excel**: File conversion, creating date scaffold for dashboarding
- **Google BigQuery**: SQL querying, data cleaning, and data extraction
- **Tableau**: Interactive dashboarding

# Data Source and License
- Dataset: Online Retail II  
- Creator: Daqing Chen
- License: Creative Commons Attribution 4.0 International (CC BY 4.0) license
- Reference: Chen, D. (2012). Online Retail II [Dataset]. UCI Machine Learning Repository. https://doi.org/10.24432/C5CG6D.

# Data
- The dataset contains information on sales occuring between 2009 and 2011 from a UK based company that typically sells gift-ware to wholesalers.
- The dataset includes invoices, item stock codes, item descriptions, quantities sold, price, customer id, invoice timestamps, and customer country between December 2009 to December 2011.

# Data Loading
- The data was in a multi-sheet Excel file format when it was downloaded, requiring conversion to another file type, such as CSV.
- Tables were made in BigQuery for each CSV file.

# Data Processing
- A union was used to combine the tables from the 2 sheets.
- Missing values and invalid countries were removed.
- Dates were extracted and timestamps were cleaned.
- Duplicates were removed.
- Prices were converted into a numerical data type.
- Korea was changed to South Korea (sales are assumed to be from South Korea not North Korea).
- Sales were computed and added as a column.

# Query Performance Metrics
The query run times, bytes shuffled, and data processed were recorded as follows for later query optimization.

| Query Step         | Elapsed Time | Slot Time | Bytes Shuffled | Data Processed |
|--------------------|--------------|-----------|----------------|----------------|
| **Union**          | 4 sec        | 21 sec    | 311.57 MB      | 92.97 MB       |
| **Preparation**    | 6 sec        | 20 sec    | 281.76 MB      | 89.96 MB       |
| **Update Table**   | 2 sec        | 15 sec    | 202.20 MB      | 90.70 MB       |
| **Computing Sales**| 4 sec        | 13 sec    | 208.14 MB      | 69.22 MB       |
| **Total**          | **16 sec**   | **69 sec**| **1003.67 MB** | **342.85 MB**  |

# Query Optimization
| Metric             | Multi-Step Total | End-to-End Pipeline | Optimized End-to-End Pipeline | Difference (Multi-Step − Optimized)  | Difference % Reduction |
|--------------------|------------------|---------------------|-------------------------------|--------------------------------------|------------------------|
| **Elapsed Time**   | 16 sec           | 15 sec              | 11 sec                        | 5 sec                                | 31.25%                 |
| **Slot Time**      | 69 sec           | 82 sec              | 71 sec                        | -2 sec                               | -2.90%                 |
| **Bytes Shuffled** | 1003.67 MB       | 501.6 MB            | 501.59 MB                     | 502.08 MB                            | 50.00%                 |
| **Data Processed** | 342.85 MB        | 182.16 MB           | 182.16 MB                     | 160.69 MB                            | 46.88%                 |

- The optimized query uses slightly more slot time than the sum of each individual query step, but has 30-50% reductions in elapsed time, bytes shuffled, and data processed.
- BigQuery offers pricing based on slot time (Capacity Pricing) or data processed (On-Demand Pricing).
- Given the size of the dataset, On-Demand Pricing should be chosen over Capacity Pricing.
- With On-Demand Pricing, costs can be reduced by 46%.

# Dashboard
- View the actual dashboard [here.](https://public.tableau.com/views/RetailSalesDashboard_17545186499380/Dashboard?:language=en-US&:sid=&:redirect=auth&:display_count=n&:origin=viz_share_link).
<img width="1799" height="1199" alt="Dashboard" src="https://github.com/user-attachments/assets/ec6c1337-bc7a-45ec-9386-22bd1f3a8e70" />

# Insights
- Regency Cakestand 3 Tier and White Hanging Heat T-Light Holder are the products with the highest sales.
- Postages and the same Regency Cakestand have the highest in sales outside of UK-based customers.
- While this business mainly sells products to the United Kingdom, other frequent buyers are from Australia, EIRE (Ireland), France, Germany, and the Netherlands.
- Customers tend to be repeat customers.
- The business had 14 fewer customers in 2011 than in 2010. Sales also decreased by 220,000 British Pounds and the number of items purchased decreased by around 500,000 in 2011 from 2010..
- There is a 33% higher average unit price from all orders outside of the UK.

# Clarifying Questions
- Given the sizeable decreases in sales and items sold between 2010 and 2011, did the business lose some wholesalers as customers?
- Are customers outside of the UK making larger or more expensive purchases?
- Demand for the Regency Cakestand is high inside and outside of the UK. However, a cakestand tends to be reusable. Will demand for it decrease over time?
