create view dbo.vw_SKUPrice
as
	select 
		*
		, dbo.udf_GetSKUPrice(ID) as SKUPrice
	from dbo.SKU
