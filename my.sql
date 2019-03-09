SELECT     (select 'ISO') as 'TransactionType',   dbo.SAL_ORDER_HDR.DATEIN AS 'TransactionDate', dbo.SAL_ORDER_HDR.SALES_ORDNO as 'TransactionNo', dbo.SAL_ORDER_HDR.BRCH_CODE as 'TransactionBranchCode', dbo.SAL_ORDER_HDR.CUSTOMER  as 'CustSuppCode', dbo.CUSTOMERS.CUST_NAME  as 'CustSuppName'
FROM            dbo.SAL_ORDER_HDR  JOIN
                         dbo.CUSTOMERS on  dbo.SAL_ORDER_HDR.CUSTOMER =  dbo.CUSTOMERS.CUST_CODE

union all

SELECT    (select 'INV') as 'TransactionType',   dbo.INVOICE_HDR.DATEIN AS 'TransactionDate', dbo.INVOICE_HDR.INV_NO as 'TransactionNo', dbo.INVOICE_HDR.BRCH_CODE as 'TransactionBranchCode', dbo.INVOICE_HDR.CUST_CODE as 'CustSuppCode', dbo.CUSTOMERS.CUST_NAME  as 'CustSuppName'
FROM            dbo.INVOICE_HDR  JOIN
                         dbo.CUSTOMERS on  dbo.CUSTOMERS.CUST_CODE = dbo.INVOICE_HDR.CUST_CODE
union all

SELECT  (select 'GDSIN') as 'TransactionType', dbo.GOODSIN_HDR.DATEIN AS 'TransactionDate', dbo.GOODSIN_HDR.GOODSIN_CODE as 'TransactionNo', dbo.GOODSIN_HDR.BRCH_CODE as 'TransactionBranchCode' , dbo.GOODSIN_HDR.SUPP_CODE as 'CustSuppCode', dbo.SUPPLIERS.SUPP_NAME as 'CustSuppName'
FROM            dbo.SUPPLIERS INNER JOIN
                         dbo.GOODSIN_HDR ON dbo.SUPPLIERS.SUPP_CODE = dbo.GOODSIN_HDR.SUPP_CODE
                         
                         
                         
exec sp_executesql N'exec StockTransferWrite @doc ',N'@doc nvarchar(1231)',N'<transfer_hdr RAISEDBY="graycorp" CODE="" currentStatus="New" nextStatus="P" DATEIN="04 MAR 2017" REQDBY="04 MAR 2017" PART_DELIVER="Y" NOBO="Y" REP_CODE="" COY_CODE_OLD="01" COY_CODE="01" BRCH_CODE_OLD="01" BRCH_CODE="01" TOBRANCH="2" ORDER_NO="" CON_NOTE="" DFIRM="Strathalbyn Storage" DADDR="22 Dunreath Street" DADDRESS2="" DSUBURB="Strathalbyn South" DSTATE="SA" DPOSTCODE="5255" DCOUNTRY="Australia" DEL_INSTR1="" DEL_INSTR2="" COMMENT1="" COMMENT2="" COMMENT3="" COMMENT4="" COMMENT5=""><transfer_dtl TRANF_QTY="10.0000" ITEM_CODE="2000" PROD_DESCN1="Freight - Melbourne" UM="Ea" IS_BATCH_PRODUCT="No" LN_STATUS="A" COS_ACCT="27000" STK_ACCT="28600" STDCOST="122.4000" EXTSTDCOST="1224.00000000" STOCKITEM="N" RecordID="35693E0F-4A3E-E911-AA16-184F32505E90" SourceTransactionType="ISO" SourceTransactionNo="165831" SourceTransactionLine="1" /><transfer_dtl TRANF_QTY="5.0000" ITEM_CODE="2001" PROD_DESCN1="Freight -  Export via Melbourne" UM="Ea" IS_BATCH_PRODUCT="No" LN_STATUS="A" COS_ACCT="27000" STK_ACCT="28600" STDCOST="123.2200" EXTSTDCOST="616.10000000" STOCKITEM="N" RecordID="36693E0F-4A3E-E911-AA16-184F32505E90" SourceTransactionType="ISO" SourceTransactionNo="165831" SourceTransactionLine="2" /></transfer_hdr>'



-- SourceTransactionType="ISO" SourceTransactionNo="165831" SourceTransactionLine="2"

