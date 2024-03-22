create table dbo.SKU (
  ID int identity primary key,
  Code  as concat('s', ID),
  Name varchar(255)
);

create table dbo.Family (
  ID int identity primary key,
  SurName varchar(255),
  BudgetValue decimal(18, 2)
);

create table dbo.Basket (
  ID int identity primary key,
  ID_SKU int not null,
  ID_Family int not null,
  Quantity decimal(18, 2) check(Quantity > 0),
  Value decimal(18, 2) check(Value > 0),
  PurchaseDate date default(CURRENT_TIMESTAMP),
  DiscountValue decimal(18, 2) default(0),
  constraint FK_Basket_ID_SKU_SKU
	foreign key (ID_SKU) references dbo.SKU(ID),
  constraint FK_Basket_ID_Family_Family
	foreign key (ID_Family) references dbo.Family(ID)
);
