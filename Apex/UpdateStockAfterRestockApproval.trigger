trigger UpdateStockAfterRestockApproval
    on Re_Plastic_Innovations_Restock_Request__c (after update) {

    List<Re_Plastic_Innovations_Restock_Request__c> approvedRequests =
        new List<Re_Plastic_Innovations_Restock_Request__c>();

    for (Re_Plastic_Innovations_Restock_Request__c restock : Trigger.new) {

        Re_Plastic_Innovations_Restock_Request__c oldRestock =
            Trigger.oldMap.get(restock.Id);

        if (restock.Status__c == 'Approved' &&
            oldRestock.Status__c != 'Approved') {

            approvedRequests.add(restock);
        }
    }

    if (!approvedRequests.isEmpty()) {

        InventoryManager.processRestockApproval(approvedRequests);

        EmailNotificationHelper.sendRestockApprovalEmail(
            approvedRequests
        );
    }
}
