# Automation

## Scheduled Flow — Stock Level Is Low

- Object: Recycled Product
- Type: Schedule-triggered Flow
- Frequency: Daily
- Time: 6:00 AM
- Decision: `$Record.Stock_Level__c < $Record.Threshold__c`
- If Yes: Create a Task
- Priority: High
- Status: In Progress
- Assigned To: `$Record.OwnerId`
- Related To: `$Record.Id`

## Order Trigger

`UpdateStockAfterOrder` runs after Order insert and delegates processing to `InventoryManager`.

## Restock Approval Trigger

`UpdateStockAfterRestockApproval` runs after Restock Request update.

It only processes a newly changed status when:

`Status = Approved` and previous status was not `Approved`.

It then:
1. Increases product stock.
2. Calls `EmailNotificationHelper`.

The restock process is a **status-based workflow**, not a Salesforce Approval Process.
