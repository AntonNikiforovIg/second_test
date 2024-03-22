create function dbo.udf_GetSKUPrice(@in_ID_SKU int)
returns decimal(18,2) 
as
	begin
		return (
			select sum(value)/sum(Quantity)
			from dbo.Basket
			where ID_SKU = @in_ID_SKU
			)
	end;
