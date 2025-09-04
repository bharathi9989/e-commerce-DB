⚪️ E-COMMERSE DATABASE (MySQL)

This project demonstrates a simple e-commerce system built in MySQL.
It manages customers, products, orders, and order items with relational integrity.

🚀 FEATURES

• Manage customers with their details.

• Manage products with price, description, and discount.

• Manage orders linked to customers.

• Normalize order data with order_items table.

• Perform useful queries such as:

  ⦾ Recent orders

  ⦾ Total spent by customers

  ⦾ Top products

  ⦾ Customer purchase history

  ❧ Database Setup  
  
  1. Create Database
  2. Create Tables
      𐂍  Customer
      𐂍  Poducts
      𐂍  Orders
      𐂍  Order Items (Normalization)
     
  3. Insert Sample Data

      𐂍 Customers
      𐂍 Products
      𐂍 Orders
      𐂍 Order_items
  4. Quaries
      ❧ Customers who placed orders in last 30 days
      ❧ Total amount of all orders by each customer
      ❧ Update price of Product C
      ❧ Top 3 products by price
      ❧ Customers who ordered Product A
      ❧ Join orders with customers
      ❧ Orders greater than 150
      ❧ Average total of all orders

  🔺 Notes

   🔆   SQL_SAFE_UPDATES may need to be disabled for updates in MySQL Workbench.

   🔆   The database is normalized by introducing an order_items table.

   🔆   Data provided is sample data; you can extend it further.
