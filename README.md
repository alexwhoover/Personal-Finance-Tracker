# Personal-Finance-Tracker
## Project Definition
After graduating university and getting proper income, I needed a way to keep track of my finances in a robust way. Previously, my financial planning included cumbersome excel spreadsheets that were getting too large to handle.

The project: to create a database to track all transactions across multiple accounts and credit cards, then create a visual dashboard to gain insights into my spending.

## Methodology
I used SQLite3 to create a relational database called tracker.db. This database includes information on all my transactions, accounts, and spending categories. See _Figure 1_ for the entity relationship diagram of this database. The accounts table includes information on my chequing account, investment account, and credit cards. The categories table includes the spending categories that I personally wanted. I then used Power BI to visualize the data and gain insights into where I can cut back my spending.

_Figure 1: E-R Diagram_
![image](https://github.com/alexwhoover/Personal-Finance-Tracker/assets/160429258/b42126a6-a59b-41ba-b0b8-de4a6b5934d9)

_Figure 2: Accounts Table_
![image](https://github.com/alexwhoover/Personal-Finance-Tracker/assets/160429258/80b9a95c-673e-4655-bb5d-7e9a4d41c733)

_Figure 3: Categories Table_
![image](https://github.com/alexwhoover/Personal-Finance-Tracker/assets/160429258/6ce5f05e-9c91-416f-a713-d5c095f4f29f)


## Data Sources and Importing
All online banking and credit card sites typically allow transaction data to be downloaded in csv format. However, all these csv files come with different organization, so I had to convert them manually to a standard format. Not all files contained category information either, and if they did, the categories were slightly different to mine. So, I would also manually categorize each transaction. This process generally took me 20-30 minutes each month.

The standard csv format for import:
date (yyyy-mm-dd) | description | amount | category_code | account_name

I would import the csv files into a temporary table in the database. I then used joins to retrieve the category_id from the category_code and the account_id from the account_name, before finally inserting the transactions into the transactions table. This was all done using pre-written SQL queries.

## Analysis
I analysed my spending data using Power BI. My main takeaways are shown below.

![image](https://github.com/alexwhoover/Personal-Finance-Tracker/assets/160429258/0a0471f5-6292-40d6-b92d-491b1a224f86)
![image](https://github.com/alexwhoover/Personal-Finance-Tracker/assets/160429258/7d34be61-14dc-419b-86ed-de90bd79884a)

