create trigger dbo.TR_Basket_insert_update on dbo.Basket after insert
as
set nocount on

begin
	update dbo.Basket
		set DiscountValue = Value * 0.05 
	where Basket.id in (
		select ID 
		from Inserted  
		where ID_SKU in(
			select ID_SKU
			from Inserted
			group by ID_SKU
			having count(*) >=2
			)
		)
end
begin
	update dbo.Basket
		set DiscountValue = 0
	where id in (
		select ID 
		from Inserted 
		where ID_SKU not in(
			select ID_SKU
			from Inserted
			group by ID_SKU
			having count(*) >=2
			)
		)
end
go
