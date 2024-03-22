create procedure dbo.usp_MakeFamilyPurchase
	@FamilySurName varchar(255)
as
begin
	declare @ErrorMessage varchar(max)

	if exists(
		select ID
		from dbo.Family
		where ID = 1
	)
	begin
		update dbo.Family
		set BudgetValue = BudgetValue - (select sum(Value) from dbo.Basket where ID_Family = @FamilySurName)
		where id = @FamilySurName
	end;
	else
	begin
		set @ErrorMessage = concat('Семьи ', @FamilySurName,' не существует.')
		raiserror(@ErrorMessage, 1, 1)
	end;
end;
