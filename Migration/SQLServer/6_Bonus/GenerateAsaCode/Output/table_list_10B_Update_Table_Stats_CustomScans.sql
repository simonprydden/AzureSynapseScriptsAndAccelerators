/* 10B. Update Table Stats With Custom Scan Rage  */
-- Code Generated at 08/02/2021 13:57:50
 
UPDATE STATISTICS SqlPoolDatabaseName.edw.FactCallCenter WITH SAMPLE 50 PERCENT;
GO 
 
UPDATE STATISTICS SqlPoolDatabaseName.edw.FactCurrencyRate WITH SAMPLE 50 PERCENT;
GO 
 
UPDATE STATISTICS SqlPoolDatabaseName.edw.FactFinance WITH SAMPLE 50 PERCENT;
GO 
 
UPDATE STATISTICS SqlPoolDatabaseName.edw.FactInternetSales WITH SAMPLE 50 PERCENT;
GO 
 
UPDATE STATISTICS SqlPoolDatabaseName.edw.FactInternetSalesReason WITH SAMPLE 50 PERCENT;
GO 
 
UPDATE STATISTICS SqlPoolDatabaseName.edw.FactProductInventory WITH SAMPLE 50 PERCENT;
GO 
 
UPDATE STATISTICS SqlPoolDatabaseName.edw.FactResellerSales WITH SAMPLE 50 PERCENT;
GO 
 
UPDATE STATISTICS SqlPoolDatabaseName.edw.FactSalesQuota WITH SAMPLE 50 PERCENT;
GO 
 
UPDATE STATISTICS SqlPoolDatabaseName.edw.FactSurveyResponse WITH SAMPLE 50 PERCENT;
GO 
 
