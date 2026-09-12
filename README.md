# RePlastix Innovations

### Transforming Plastic Waste into Sustainable Solutions

A Salesforce-based project for managing plastic-waste collection, recycling centers, recycled-product inventory, customer orders, and automated restocking.

**Student:** Kedharnadh Veeramalla  
**Roll No.:** 238W1A0562  
**Branch:** CSE  
**College:** VR Siddhartha Engineering College  
**Environment:** Salesforce

---

## 1. Project Overview

RePlastix Innovations provides a centralized Salesforce solution for managing the operational lifecycle of plastic waste and recycled products.

The implementation connects:

- Plastic waste collection
- Recycling-center management
- Recycled-product inventory
- Customer orders
- Restock requests
- Low-stock monitoring
- Inventory automation
- Role-based access
- Data validation
- Apex-based transaction processing

---

## 2. Problem Statement

Plastic recycling operations can involve separate records for collected waste, recycling centers, finished recycled products, customer orders, and replenishment activities. Manual tracking can make stock visibility and shortage handling difficult.

This project uses Salesforce to connect these activities in one system and automate important inventory processes.

---

## 3. Main Features

### Plastic Waste Management
Records plastic waste using weight, type, collection date, status, location, and recycling center.

### Recycling Center Management
Stores recycling-center location and processing capacity.

### Recycled Product Inventory
Maintains stock level, threshold, price, and calculated stock status.

### Customer Orders
Records customer, recycled product, quantity, and delivery date.

### Automated Stock Processing
When an order is created:
- If sufficient stock exists, stock is reduced automatically.
- If stock is insufficient, a Pending Restock Request is created for the shortage.

### Restock Processing
When a Pending Restock Request changes to Approved:
- Product stock is increased by the requested quantity.
- The notification helper is invoked.

### Low-Stock Monitoring
A scheduled Flow runs daily at 6:00 AM and creates a High-priority Task when stock is below the configured threshold.

### Data Validation
- Order quantity must be greater than zero.
- Plastic-waste collection date cannot be in the future.

### Security
Profiles, roles, private organization-wide defaults, and sharing rules provide controlled access.

---

## 4. Salesforce Architecture

### Custom Objects

| Object | Purpose |
|---|---|
| Plastic Waste | Collection and waste-processing records |
| Recycling Center | Recycling-center details and capacity |
| Recycled Product | Finished-product inventory |
| Order | Customer product orders |
| Restock Request | Inventory shortage and replenishment |

### Relationships

- Plastic Waste → Recycling Center: Lookup
- Order → Account: Customer lookup
- Order → Recycled Product: Lookup
- Restock Request → Recycled Product: Lookup

---

## 5. Automation Architecture

```text
Customer Order
      |
      v
Order Trigger
      |
      v
InventoryManager
   /        \
Enough      Insufficient
Stock       Stock
 |             |
 v             v
Reduce       Create Pending
Stock        Restock Request
                 |
                 v
              Approved
                 |
                 v
          Increase Stock
                 |
                 v
      EmailNotificationHelper
```

A separate Scheduled Flow checks product stock against the threshold every day.

---

## 6. Apex Components

### InventoryManager
Contains the reusable business logic for:
- Processing order stock
- Creating shortage restock requests
- Processing approved restock requests

### UpdateStockAfterOrder
After an Order is inserted, calls `InventoryManager.processOrderStock()`.

### UpdateStockAfterRestockApproval
After a Restock Request is updated, detects a new `Pending → Approved` status change and calls the inventory and notification logic.

### EmailNotificationHelper
Provides the Apex-based restock approval notification mechanism.

### InventoryManagerTest
Tests:
1. Sufficient-stock order processing
2. Insufficient-stock restock creation
3. Restock approval and stock increase

---

## 7. Testing

The project test scenarios verify the core inventory workflow.

| Scenario | Expected Result |
|---|---|
| Order quantity within stock | Stock decreases |
| Order quantity exceeds stock | Pending restock request is created |
| Restock changes to Approved | Product stock increases |

The documented Salesforce test execution achieved successful results and full code coverage for the implemented Apex components.

---

## 8. Security Model

The project uses:

- Platform 1 / Platform 2 / Platform 3 profiles
- CEO → Recycling Manager
- CEO → Sales Representative → Warehouse Supervisor
- Private OWD for restricted custom objects
- Sharing rules for required record visibility

---

## 9. Documentation

The complete project documentation is available here:

`Documentation/RePlastix_Innovations_Project_Documentation.pdf`

The PDF contains the five project phases, implementation details, screenshots, testing evidence, security configuration, technical blueprint, setup manual, demo planning, and future scalability plan.

---

## 10. Project Demo Flow

The recommended demonstration sequence is:

1. Introduce the project
2. Explain the problem
3. Open the Re Plastic Innovations Lightning application
4. Show recycled-product inventory
5. Create a sufficient-stock order and show stock reduction
6. Create an insufficient-stock order
7. Show the automatically created Pending Restock Request
8. Change it to Approved and show stock increase
9. Show the Scheduled Flow
10. Briefly show Apex classes and test results
11. Conclude with the project outcome

---

## 11. Future Enhancements

The architecture can be extended with:

- Management dashboards and reports
- More detailed recycling stages
- Richer inventory analytics
- Additional notification preferences
- Additional automation as record volume grows

---

## 12. Technology

- Salesforce Platform
- Lightning Application
- Custom Objects and Fields
- Lookup Relationships
- Formula Field
- Validation Rules
- Scheduled Flow
- Apex Classes
- Apex Triggers
- Apex Test Class
- Profiles, Roles, OWD and Sharing Rules

---

**Project:** RePlastix Innovations  
**Student:** Kedharnadh Veeramalla  
**Roll No.:** 238W1A0562
