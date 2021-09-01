-- Query for: Column Detail

SELECT 
	DATABASENAME, 
	TABLENAME, 
	COLUMNNAME, 
	COLUMNTYPE, 
	NULLABLE, 
	LENGTH, 
	DATATYPEPRECISION, 
	SCALE     
FROM (
	SELECT 
		a.DATABASENAME AS DATABASENAME, 
		a.TABLENAME AS TABLENAME, 
		a.COLUMNNAME AS COLUMNNAME,         
		a.NULLABLE AS NULLABLE, 
		a.COLUMNLENGTH AS LENGTH, 
		a.DECIMALTOTALDIGITS AS DATATYPEPRECISION,         
		a.DECIMALFRACTIONALDIGITS AS SCALE,                  
		CASE             
			WHEN COLUMNTYPE='CF' THEN 'CHAR'             
			WHEN COLUMNTYPE='CV' THEN 'VARCHAR'             
			WHEN COLUMNTYPE='D' THEN 'DECIMAL'             
			WHEN COLUMNTYPE='TS' THEN 'TIMESTAMP'             
			WHEN COLUMNTYPE='I' THEN 'INTEGER'             
			WHEN COLUMNTYPE='I1' THEN 'BYTEINT'   
			WHEN COLUMNTYPE='I8' THEN 'BIGINT'      
			WHEN COLUMNTYPE='PD' THEN 'PERIOD DATE'    
			WHEN COLUMNTYPE='PS' THEN 'PERIOD TIMESTAMP' 	
			WHEN COLUMNTYPE='PZ' THEN 'PERIOD TIME WITH TIME ZONE'    
			WHEN COLUMNTYPE='PT' THEN 'PERIOD TIME' 	
			WHEN COLUMNTYPE='PM' THEN 'PERIOD TIMESTAMP WITH TIME ZONE'        
			WHEN COLUMNTYPE='I2' THEN 'SMALLINT'             
			WHEN COLUMNTYPE='DA' THEN 'DATE'             
			WHEN COLUMNTYPE='CO' THEN 'CLOB'                   
			WHEN COLUMNTYPE='BO' THEN 'BLOB'             
			WHEN COLUMNTYPE='DH' THEN 'INTERVAL DAY TO HOUR'             
			WHEN COLUMNTYPE='DM' THEN 'INTERVAL DAY TO MINUTE'             
			WHEN COLUMNTYPE='DS' THEN 'INTERVAL DAY TO SECOND'             
			WHEN COLUMNTYPE='DY' THEN 'INTERVAL DAY'             
			WHEN COLUMNTYPE='F' THEN  'FLOAT'             
			WHEN COLUMNTYPE='BF' THEN 'BYTE'             
			WHEN COLUMNTYPE='BV' THEN 'VARBYTE'             
			WHEN COLUMNTYPE='GF' THEN 'GRAPHIC'                         
			WHEN COLUMNTYPE='GV' THEN 'VARGRAPHIC'                         
			WHEN COLUMNTYPE='AT' THEN 'TIME'             
			WHEN COLUMNTYPE='HM' THEN 'INTERVAL HOUR TO MINUTE'             
			WHEN COLUMNTYPE='HR' THEN 'INTERVAL HOUR'             
			WHEN COLUMNTYPE='HS' THEN 'INTERVAL HOUR TO SECOND'             
			WHEN COLUMNTYPE='MI' THEN 'INTERVAL MINUTE'             
			WHEN COLUMNTYPE='MO' THEN 'INTERVAL MONTH'             
			WHEN COLUMNTYPE='MS' THEN 'INTERVAL MINUTE TO SECOND'             
			WHEN COLUMNTYPE='SC' THEN 'INTERVAL SECOND'             
			WHEN COLUMNTYPE='SZ' THEN 'TIMESTAMP WITH TIME ZONE'             
			WHEN COLUMNTYPE='TZ' THEN 'TIME WITH TIME ZONE'             
			WHEN COLUMNTYPE='YM' THEN 'INTERVAL YEAR TO MONTH'             
			WHEN COLUMNTYPE='YR' THEN 'INTERVAL YEAR'             
			WHEN COLUMNTYPE='N' THEN 'NUMBER'                                                             
			WHEN COLUMNTYPE='UT' THEN 'UDT Type'                                                             
		ELSE COLUMNTYPE         
		END AS COLUMNTYPE
	FROM DBC.COLUMNSV a          
		INNER JOIN DBC.Databases d ON a.databasename  = d.databasename         
	WHERE EXISTS (         
		SELECT 1 FROM dbc.tables b
		WHERE a.databasename = b.databasename AND  a.TABLENAME = b.TABLENAME                 
		AND  b.tablekind = 'T'                 
		AND b.databasename NOT IN ('console', 'DBC', 'dbcmngr', 'LockLogShredder', 'SQLJ', 'SysAdmin', 'SYSBAR', 'SYSJDBC', 'SYSLIB', 'SYSSPATIAL', 
			'SystemFe', 'SYSUDTLIB', 'SYSUIF', 'Sys_Calendar', 'TDQCD', 'TDStats', 'tdwm', 'TD_SERVER_DB', 'TD_SYSFNLIB', 'TD_SYSGPL','TD_SYSXML',
			'PDCRAdmin','PDCRCanary1M','PDCRINFO','PDCRSTG','PDCRCanary0M','PDCRCanary2M','PDCRCanary3M','PDCRADM','PDCRAccess','PDCRTPCD','PDCRCanary4M','PDCRDATA','TDMaps') 
		) 
	) TBL;
