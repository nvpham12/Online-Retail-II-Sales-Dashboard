# Online Retail Sales Dashboard
## Goal
Build a cost-efficient sales analytics dashboard by implementing an ETL pipeline—extracting sales data from the source, transforming and cleaning it in BigQuery, and loading the filtered dataset into Tableau to identify trends by time, product, and country.

## Approach
- Cleaned & transformed Online Retail II dataset in BigQuery, creating calculated sales metrics and date scaffolding for Tableau integration.
- Consolidated multi-step queries into an optimized end-to-end pipeline, reducing data processed by 46% and bytes shuffled by 50%.
- Designed an interactive Tableau dashboard with filters for date and location, using colorblind-friendly palettes.

## Key Results
- Query runtime improved by 31% and query costs lowered by 46% under BigQuery’s on-demand pricing model.
- Identified top-selling products and markets, with higher average unit prices for non-UK sales (+33%).
- Noted a £220k drop in sales and 14 fewer customers in 2011 vs. 2010.

## Links
- [Tableau Dashboard](https://public.tableau.com/views/RetailSalesDashboard_17545186499380/Dashboard?:language=en-US&:sid=&:redirect=auth&:display_count=n&:origin=viz_share_link)
- [Full Technical Report](https://github.com/nvpham12/Online-Retail-II-Sales-Dashboard/blob/main/Technical%20Report%20Online%20Retail%20Dashboard.md)

## Data Source and License
- Dataset: Online Retail II  
- Creator: Daqing Chen
- License: Creative Commons Attribution 4.0 International (CC BY 4.0) license
- Reference: Chen, D. (2012). Online Retail II [Dataset]. UCI Machine Learning Repository. https://doi.org/10.24432/C5CG6D.
