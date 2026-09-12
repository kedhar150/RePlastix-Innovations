# Salesforce Objects and Fields

## 1. Re Plastic Innovations Plastic Waste
API Name: `Re_Plastic_Innovations_Plastic_Waste__c`

- Name: Auto Number
- Weight__c: Number (18,2)
- Type__c: Picklist
- Collection_Date__c: Date
- Status__c: Picklist
- Recycling_Center__c: Lookup to Recycling Center
- Location__c: Geolocation

## 2. Re Plastic Innovations Recycling Center
API Name: `Re_Plastic_Innovations_Recycling_Center__c`

- Name: Text
- Location__c: Geolocation
- Capacity__c: Number (18,2)

## 3. Re Plastic Innovations Recycled Product
API Name: `Re_Plastic_Innovations_Recycled_Product__c`

- Name: Text
- Stock_Level__c: Number
- Threshold__c: Number
- Price__c: Currency
- Stock Low On Product: Formula (Text)

Formula:
`IF(Stock_Level__c < Threshold__c, "Low Stock - Restock Needed", "Sufficient Stock")`

## 4. Re Plastic Innovations Order
API Name: `Re_Plastic_Innovations_Order__c`

- Name: Auto Number
- Customer__c: Lookup to Account
- Recycled_Product__c: Lookup to Recycled Product
- Quantity__c: Number
- Delivery_Date__c: Date

## 5. Re Plastic Innovations Restock Request
API Name: `Re_Plastic_Innovations_Restock_Request__c`

- Name: Auto Number
- Product__c: Lookup to Recycled Product
- Requested_Quantity__c: Number
- Status__c: Picklist (Pending, Approved, Completed)
