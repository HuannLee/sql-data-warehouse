Create or alter procedure bronze.load_bronze as
begin
	declare @start_time datetime , @end_time datetime , @batch_start_time datetime , @batch_end_time datetime;
	begin try
	print '===========================================';
	print 'loading bronze layer';
	print '===========================================';

	print '-------------------------------------------';
	print 'Loading CRM tables';
	print '-------------------------------------------';
	set @batch_start_time = GETDATE();
	set @start_time = GETDATE();
	print '>> Truncating table: bronze.crm_cust_info';
	truncate table bronze.crm_cust_info;
	print '>> Inserting data Into : bronze.crm_cust_info';
	bulk insert bronze.crm_cust_info
	from 'C:\Donttouchme\Năm 3 - HK1\DataWarehouse\sql-data-warehouse-project\sql-data-warehouse-project\datasets\source_crm\cust_info.csv'
	with (
		firstrow = 2,
		fieldterminator = ',',
		tablock
	);
	set @end_time = GETDATE();
	print '>> Load Duration : ' + cast( DATEDIFF(second, @start_time, @end_time) as nvarchar) + ' seconds';
	print '---------------';

	set @start_time = GETDATE();
	print '>> Truncating table: bronze.crm_prd_info';
	truncate table bronze.crm_prd_info;
	print '>> Inserting data Into : bronze.crm_prd_info';
	bulk insert bronze.crm_prd_info
	from 'C:\Donttouchme\Năm 3 - HK1\DataWarehouse\sql-data-warehouse-project\sql-data-warehouse-project\datasets\source_crm\prd_info.csv'
	with (
		firstrow = 2,
		fieldterminator = ',',
		tablock
	);
	set @end_time = GETDATE();
	print '>> Load Duration : ' +cast( DATEDIFF(second, @start_time, @end_time) as nvarchar) + ' seconds';
	print '---------------';

	set @start_time = GETDATE();
	print '>> Truncating table: bronze.crm_sales_details';
	truncate table bronze.crm_sales_details;
	print '>> Inserting data Into : bronze.crm_sales_details';
	bulk insert bronze.crm_sales_details
	from 'C:\Donttouchme\Năm 3 - HK1\DataWarehouse\sql-data-warehouse-project\sql-data-warehouse-project\datasets\source_crm\sales_details.csv'
	with (
		firstrow = 2,
		fieldterminator = ',',
		tablock
	);
	set @end_time = GETDATE();
	print '>> Load Duration : ' +cast( DATEDIFF(second, @start_time, @end_time) as nvarchar) + ' seconds';
	print '---------------';

	print '-------------------------------------------';
	print 'Loading ERP tables';
	print '-------------------------------------------';

	set @start_time = GETDATE();
	print '>> Truncating table: bronze.erp_cust_az12';
	truncate table bronze.erp_cust_az12;
	print '>> Inserting data Into : bronze.erp_cust_az12';
	bulk insert bronze.erp_cust_az12
	from 'C:\Donttouchme\Năm 3 - HK1\DataWarehouse\sql-data-warehouse-project\sql-data-warehouse-project\datasets\source_erp\cust_az12.csv'
	with (
		firstrow = 2,
		fieldterminator = ',',
		tablock
	);
	set @end_time = GETDATE();
	print '>> Load Duration : ' +cast( DATEDIFF(second, @start_time, @end_time) as nvarchar) + ' seconds';
	print '---------------';


	set @start_time = GETDATE();
	print '>> Truncating table: bronze.erp_loc_a101';
	truncate table bronze.erp_loc_a101;
	print '>> Inserting data Into : bronze.erp_loc_a101';
	bulk insert bronze.erp_loc_a101
	from 'C:\Donttouchme\Năm 3 - HK1\DataWarehouse\sql-data-warehouse-project\sql-data-warehouse-project\datasets\source_erp\loc_a101.csv'
	with (
		firstrow = 2,
		fieldterminator = ',',
		tablock
	);
	set @end_time = GETDATE();
	print '>> Load Duration : ' +cast( DATEDIFF(second, @start_time, @end_time) as nvarchar) + ' seconds';
	print '---------------';

	set @start_time = GETDATE();
	print '>> Truncating table: bronze.erp_px_cat_g1v2';
	truncate table bronze.erp_px_cat_g1v2;
	print '>> Inserting data Into : bronze.erp_px_cat_g1v2';
	bulk insert bronze.erp_px_cat_g1v2
	from 'C:\Donttouchme\Năm 3 - HK1\DataWarehouse\sql-data-warehouse-project\sql-data-warehouse-project\datasets\source_erp\px_cat_g1v2.csv'
	with (
		firstrow = 2,
		fieldterminator = ',',
		tablock
	);
	set @end_time = GETDATE();
	print '>> Load Duration : ' +cast( DATEDIFF(second, @start_time, @end_time) as nvarchar) + ' seconds';
	print '---------------';
	SET @batch_end_time = GETDATE();
	print '>> Load All Table Duration : ' +cast( DATEDIFF(second, @batch_start_time, @batch_end_time) as nvarchar) + ' seconds';
	print '---------------';
	end try
	begin catch
		print '======================================='
		print 'Error occured during loading bronze layer'
		print 'Error message' + error_message();
		print 'Error message' + cast (error_number() as nvarchar)
		print 'Error message' + cast (error_state() as nvarchar)
		print '======================================='
	end catch
End
