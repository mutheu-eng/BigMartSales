# BigMart Sales

## Table of Contents
- [Project Overview](#project-overview)
- [Tools](tools)
- [Data Analysis Process](data-analysis-process)
- [Findings](findings)
- [Recommendations](recommendations)

### Project Overview 

Big Mart hypermarket, main objective for July is to improve their sales, they tasked me with the responsibility of analyzing their data, 
understanding the trends, and providing insights. 
I follow the data analysis process to achieve the objectives set.

![Store type](https://github.com/mutheu-eng/BigMartSales/assets/121784849/54c09b43-5497-41c7-8b96-75a09874eb8c)

![storeszie](https://github.com/mutheu-eng/BigMartSales/assets/121784849/f439e6b6-ece7-4ce5-ace2-4d2fa087b620)

![fatcontent](https://github.com/mutheu-eng/BigMartSales/assets/121784849/67b16222-3043-4a7c-92a7-4472310662a2)


### Tools:
 1. Ms. Excel
 2. Python
 3. SQL
 4. Power BI

### Data Analysis Process 
- Data understanding/Familiarization: Ms. Excel

#### Data Cleaning
  - Handling Missing values: Python
      - I imputed the missing values with mean and mode
  - Inconsistent data: Ms.Excel
  - Duplicate values: Ms.Excel
``` python
product_mean = train.groupby('Product_Type')['Product_Weight'].mean() 

def replace_weight_with_mean(row):
    if pd.isnull(row['Product_Weight']):
        return product_mean[row['Product_Type']]
    else:
        return row['Product_Weight']
    
train['Product_Weight'] = train.apply(replace_weight_with_mean, axis=1)

```
 
#### Data Analysis
-  I used PostgreSQL to answer the following questions that would be a good lead to our insights:
    - Which product type has the highest number of sales?
    - Which store type has the highest number of sales?
    - Which store size has the highest number of sales?
    - Which store tier has the highest number of sales?
    - Is there a correlation between product weight and sales?
    - Is there a relationship between MRP(Maximum Retail Price) and Sales?
    - Sales by product fat content
  ``` SQL

SELECT
    (
        (COUNT(*) * SUM(Product_MRP * Sales)) - (SUM(Product_MRP) * SUM(Sales))
    ) / (
        SQRT((COUNT(*) * SUM(Product_MRP * Product_MRP)) - (SUM(Product_MRP) * SUM(Product_MRP))) *
        SQRT((COUNT(*) * SUM(Sales * Sales)) - (SUM(Sales) * SUM(Sales)))
    ) AS correlation
FROM sales_data;
```
   
#### Data Visualization and Reporting
 - I used Power BI to visualize my findings to the Big Mart hypermarket stakeholders.

### Findings
1. Fruits and vegetables, Snack Foods, Household, Frozen foods and Canned are products with the highest number of sales.
2. Seafood, breakfast,others, Hard drinks and starchy foods are products with the lowest number of sales.
3. Supermarket type 1 had the highest number of sales with a contribution of 71%, while groceries had 2%
4. Medium-sized store has the highest number of sales, while high-sized store had the least stores.
5. Tier 3 had the highets number of sales compared to Tier 2 and 1 which had the least number of sales.
6. The correlation of product MRP and sales is 0.58, there is minimal correlation between these factors.
8. Products with regular fat content had the highest sales compared to low fat products.

### Recommendations
- Since products like Fruits and Vegetables, Snack Foods, Household items, Frozen Foods, and Canned goods are driving the highest number of sales, it would be wise to focus on these product categories. Strategies such as expanding product offerings, improving product quality, or running targeted marketing campaigns to further capitalize on their popularity should be implemented.
- Products with the lowest number of sales, such as Seafood, Breakfast items, Hard Drinks, and Starchy Foods, may benefit from reevaluation or diversification. Explore ways to attract more customers to these categories, such as introducing new product variants, offering promotions, or improving product visibility.
- Supermarket type 1 contributes the most to sales, while groceries contribute less, suggests that investing resources into Supermarket type 1 could yield higher returns. Consideration of optimizing operations, marketing efforts, and inventory management for Supermarket type 1 stores to maintain or improve their sales performance should be done.
- Since Tier 3 markets have the highest sales compared to Tiers 1 and 2, prioritize market penetration and marketing efforts in Tier 3 markets.
- Recognizing that products with regular fat content drive higher sales compared to low-fat products, consider leveraging this insight in product positioning, marketing messaging, or product development.


  


