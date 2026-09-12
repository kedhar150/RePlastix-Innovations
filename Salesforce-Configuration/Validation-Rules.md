# Validation Rules

## Order — Check_Quantity_Not_Zero

Formula:
`Quantity__c <= 0`

Error:
`Quantity must be greater than zero.`

Purpose: prevents zero or negative order quantities.

## Plastic Waste — Future_Date_Collection

Formula:
`Collection_Date__c > TODAY()`

Error:
`Collection Date cannot be in the future.`

Purpose: prevents future collection dates.
