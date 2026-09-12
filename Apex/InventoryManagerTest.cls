@isTest
public class InventoryManagerTest {

    @testSetup
    static void setupTestData() {

        Re_Plastic_Innovations_Recycled_Product__c product =
            new Re_Plastic_Innovations_Recycled_Product__c(
                Stock_Level__c = 50,
                Threshold__c = 10
            );

        insert product;
    }

    @isTest
    static void testEnoughStockOrder() {

        Re_Plastic_Innovations_Recycled_Product__c product =
            [SELECT Id, Stock_Level__c
             FROM Re_Plastic_Innovations_Recycled_Product__c
             LIMIT 1];

        Re_Plastic_Innovations_Order__c orderRecord =
            new Re_Plastic_Innovations_Order__c(
                Recycled_Product__c = product.Id,
                Quantity__c = 20
            );

        Test.startTest();
        insert orderRecord;
        Test.stopTest();

        product =
            [SELECT Stock_Level__c
             FROM Re_Plastic_Innovations_Recycled_Product__c
             WHERE Id = :product.Id];

        System.assertEquals(
            30,
            product.Stock_Level__c,
            'Stock should reduce correctly'
        );
    }

    @isTest
    static void testInsufficientStockOrder() {

        Re_Plastic_Innovations_Recycled_Product__c product =
            [SELECT Id
             FROM Re_Plastic_Innovations_Recycled_Product__c
             LIMIT 1];

        Re_Plastic_Innovations_Order__c orderRecord =
            new Re_Plastic_Innovations_Order__c(
                Recycled_Product__c = product.Id,
                Quantity__c = 70
            );

        Test.startTest();
        insert orderRecord;
        Test.stopTest();

        List<Re_Plastic_Innovations_Restock_Request__c> requests =
            [SELECT Id, Requested_Quantity__c, Status__c
             FROM Re_Plastic_Innovations_Restock_Request__c
             WHERE Product__c = :product.Id];

        System.assertEquals(
            1,
            requests.size(),
            'One restock request should be created'
        );

        System.assertEquals(
            20,
            requests[0].Requested_Quantity__c,
            'Restock quantity should be the shortage'
        );

        System.assertEquals(
            'Pending',
            requests[0].Status__c
        );
    }

    @isTest
    static void testRestockApproval() {

        Re_Plastic_Innovations_Recycled_Product__c product =
            [SELECT Id, Stock_Level__c
             FROM Re_Plastic_Innovations_Recycled_Product__c
             LIMIT 1];

        Re_Plastic_Innovations_Restock_Request__c request =
            new Re_Plastic_Innovations_Restock_Request__c(
                Product__c = product.Id,
                Requested_Quantity__c = 30,
                Status__c = 'Pending'
            );

        insert request;

        Test.startTest();

        request.Status__c = 'Approved';
        update request;

        Test.stopTest();

        product =
            [SELECT Stock_Level__c
             FROM Re_Plastic_Innovations_Recycled_Product__c
             WHERE Id = :product.Id];

        System.assertEquals(
            80,
            product.Stock_Level__c,
            'Stock should increase after restock approval'
        );
    }
}
