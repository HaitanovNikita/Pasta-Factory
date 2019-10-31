/*
Необхідно забезпечити: 
1.1. Формування і перегляд переліку продукції, яку виготовляє макаронна фабрика. 
1.2. Формування і перегляд переліку сировини, з якої виготовлять макаронні вироби.
1.3. Формування і перегляд відомостей про споживачів продукції.

Мати можливість:
1.4. Формувати замовлення на постачання продукції.
1.5. Формувати відвантаження продукції згідно попереднього замовлення.
1.6. Формувати і переглядати відомості про виготовлену продукцію.
1.7. Формувати і переглядати відомості про відвантажену продукцію.
1.8. Формувати і переглядати відомості про невиконані вчасно замовлення.
1.9. Формувати і переглядати відомості про попит на продукцію.
2.1. Формувати і переглядати відомості про наявність сировини на певний момент часу.
2.2. Формувати і переглядати відомості про обсяги виробництва за вказаний період.

*/
-- создано
create database MakaronFactory
-- создано
use MakaronFactory


-- создано
create table Pasta(
ID int identity not null primary key ,
productClass int not null , -- класс изделия
typeProduct int not null , -- тип продукта
productionDate date not null, -- дата изготовления
rawMaterial int not null, -- сырье
priceProduct float not null, -- цена изделия
implementationPhase varchar(50) not null -- статус изделия(продано/ не продано)Sold / Not Sold
)

-- создано
insert into Pasta values (1,1,'2019-10-25',1,12.50,'not sold');
insert into Pasta values (2,3,'2019-10-21',3,2.33,'not sold');
insert into Pasta values (1,4,'2019-10-23',4,7.50,'not sold');
insert into Pasta values (1,4,'2019-10-24',3,7.50,'sold');
insert into Pasta values (2,3,'2019-10-26',2,10.50,'not sold');
insert into Pasta values (1,2,'2019-10-27',1,12.50,'sold');
insert into Pasta values (1,4,'2019-10-27',1,12.50,'sold');
insert into Pasta values (1,4,'2019-10-27',3,12.50,'sold');
insert into Pasta values (1,4,'2019-09-17',3,8.75,'sold');
insert into Pasta values (1,3,'2019-10-25',3,11.00,'sold');
insert into Pasta values (1,3,'2019-10-07',3,9.33,'sold');
insert into Pasta values (1,2,'2019-1-12',1,10.25,'sold');
insert into Pasta values (1,1,'2019-09-05',1,12.50,'sold');



select * from pasta

-- создано
create table RawMaterial(
ID int identity not null primary key ,
flour integer not null ,--мука
amountOfFlour integer not null  -- количество муки
)

-- создано
insert into RawMaterial values(1,145);
insert into RawMaterial values(2,231);
insert into RawMaterial values(3,123);
insert into RawMaterial values(4,767);
insert into RawMaterial values(5,2134);

select * from  RawMaterial

-- создано
create table TypeOfFlour(
ID int identity not null primary key,
typeFlour varchar(50) not null -- вид муки
)
-- создано
insert into TypeOfFlour values('Rice flour');
insert into TypeOfFlour values('Buckwheat flour');
insert into TypeOfFlour values('Corn flour');
insert into TypeOfFlour values('Mung bean starch flour');
insert into TypeOfFlour values('Wheat flour');

select * from  TypeOfFlour

-- создано
create table TypeProduct(
ID int identity not null primary key,
nameProduct varchar(50) not null -- название изделия
)

-- создано
insert into TypeProduct values('Capellini');
insert into TypeProduct values('Vermicelli');
insert into TypeProduct values('Spaghettini');
insert into TypeProduct values('Spaghettoni');
insert into TypeProduct values('Bucatini');
insert into TypeProduct values('Maccheroncini');
insert into TypeProduct values('Bavette');

-- создано
create table Consumer(
ID int identity not null primary key,
fname varchar(50) not null,-- имя
lname varchar(50) not null,-- фамилия
phoneNumber varchar(15) not null -- контактный номер 
)

-- создано
insert into Consumer values('Vladislava','Rasskazova','380997773311');
insert into Consumer values('Alex','Star','380954321234');
insert into Consumer values('Jonny','Walker','380975674565');
insert into Consumer values('Jack','Wilson','380962351023');
insert into Consumer values('Ronny','Cray','380664567678');
insert into Consumer values('Renji','Cray','380663456776');

-- создано
create table ProductOrder(
ID int identity not null primary key,
pasta int not null, -- название макаронного изделия
numberOfItems int not null,-- количество изделий 
orderMetadata int not null -- номер заказа с метаданными
)
-- создано
insert into ProductOrder values(1,5,1);
insert into ProductOrder values(3,2,1);
insert into ProductOrder values(2,1,1);
insert into ProductOrder values(4,4,1);
insert into ProductOrder values(4,5,2);
insert into ProductOrder values(1,3,2);
insert into ProductOrder values(2,4,2);
insert into ProductOrder values(3,12,1);
insert into ProductOrder values(4,2,3);
insert into ProductOrder values(5,14,3);
insert into ProductOrder values(6,4,3);
insert into ProductOrder values(4,25,2);
insert into ProductOrder values(5,3,2);
insert into ProductOrder values(4,4,2);

-- создано
update ProductOrder set numberOfItems = 3 where ProductOrder.ID = 7
update ProductOrder set numberOfItems = 12 where ProductOrder.ID = 6
update ProductOrder set numberOfItems = 9 where ProductOrder.ID = 5
update ProductOrder set numberOfItems = 17 where ProductOrder.ID = 4
update ProductOrder set numberOfItems = 21 where ProductOrder.ID = 3
update ProductOrder set numberOfItems = 22 where ProductOrder.ID = 2
update ProductOrder set numberOfItems = 15 where ProductOrder.ID = 1

-- создано
create table MetadataOrder(
ID int identity not null primary key,
consumer int not null,-- заказчик
deliveryDate date not null, -- дата доставки
orderDate date not null -- дата заказа
)

-- создано
insert into MetadataOrder values(1,'2019-11-28','2019-10-23');
insert into MetadataOrder values(1,'2019-11-25','2019-10-13');
insert into MetadataOrder values(1,'2019-11-24','2019-10-15');
insert into MetadataOrder values(1,'2019-11-23','2019-10-15');
insert into MetadataOrder values(1,'2019-11-22','2019-10-18');
insert into MetadataOrder values(1,'2019-11-21','2019-10-08');

select * from MetadataOrder

update MetadataOrder set consumer = 5 where  MetadataOrder.ID  = 5
--Запросы--
/*

2.2. Формувати і переглядати відомості про обсяги виробництва за вказаний період.
*/

--1.1.Формування і перегляд переліку продукції, яку виготовляє макаронна фабрика. 
 
 Select
 TypeProduct.nameProduct[Pasta],Pasta.productClass[Class],
 Pasta.productionDate[Production date],TypeOfFlour.typeFlour[TypeOfFlour],
 Pasta.priceProduct[Price], Pasta.implementationPhase[implementation phase] 
 from Pasta 
 inner join TypeProduct on Pasta.typeProduct = typeProduct.ID
 inner join RawMaterial on Pasta.rawMaterial = RawMaterial.ID
 inner join TypeOfFlour on RawMaterial.flour = TypeOfFlour.ID
 
 
 --1.2. Формування і перегляд переліку сировини, з якої виготовлять макаронні вироби.

 Select TypeProduct.nameProduct[Pasta],TypeOfFlour.typeFlour[TypeOfFlour]
 from Pasta
 inner join TypeProduct on Pasta.typeProduct = typeProduct.ID
 inner join RawMaterial on Pasta.rawMaterial = RawMaterial.ID
 inner join TypeOfFlour on RawMaterial.flour = TypeOfFlour.ID

 -- 1.3. Формування і перегляд відомостей про споживачів продукції.
 Select fname[Name],lname[Surname], phoneNumber[Contact phone] from Consumer

 -- 1.4. Формувати замовлення на постачання продукції.
 Select 
 concat(Consumer.fname,' ',Consumer.lname,' | ',Consumer.phoneNumber)[Info about consumer],
 concat(Pasta.productClass,' class | ',TypeProduct.nameProduct,' | Summ order: ',Pasta.priceProduct*ProductOrder.numberOfItems)[Info about pasta],
 MetadataOrder.orderDate[Order date],MetadataOrder.deliveryDate[deliveryDate]
 from ProductOrder
 inner join MetadataOrder on ProductOrder.orderMetadata = MetadataOrder.ID
 inner join Pasta on ProductOrder.pasta = Pasta.ID
 inner join TypeProduct on Pasta.typeProduct = typeProduct.ID
 inner join RawMaterial on Pasta.rawMaterial = RawMaterial.ID
 inner join TypeOfFlour on RawMaterial.flour = TypeOfFlour.ID
 inner join Consumer on MetadataOrder.consumer = Consumer.ID
 where Pasta.implementationPhase = 'not sold'

 -- 1.5. Формувати відвантаження продукції згідно попереднього замовлення.  -!

 -- 1.6. Формувати і переглядати відомості про виготовлену продукцію.
 --Продукция которая есть в наличии

 Select 
  TypeProduct.nameProduct[Pasta],Pasta.productClass[Class],
 Pasta.productionDate[Production date],TypeOfFlour.typeFlour[TypeOfFlour],
 Pasta.priceProduct[Price], Pasta.implementationPhase[implementation phase]
 from Pasta 
 inner join TypeProduct on Pasta.typeProduct = typeProduct.ID
 inner join RawMaterial on Pasta.rawMaterial = RawMaterial.ID
 inner join TypeOfFlour on RawMaterial.flour = TypeOfFlour.ID
 where Pasta.implementationPhase = 'not sold'

 -- 1.7. Формувати і переглядати відомості про відвантажену продукцію.
  Select 
  TypeProduct.nameProduct[Pasta],Pasta.productClass[Class],
 Pasta.productionDate[Production date],TypeOfFlour.typeFlour[TypeOfFlour],
 Pasta.priceProduct[Price], Pasta.implementationPhase[implementation phase]
 from Pasta 
 inner join TypeProduct on Pasta.typeProduct = typeProduct.ID
 inner join RawMaterial on Pasta.rawMaterial = RawMaterial.ID
 inner join TypeOfFlour on RawMaterial.flour = TypeOfFlour.ID
 where Pasta.implementationPhase = 'sold'

 
 --1.8. Формувати і переглядати відомості про невиконані вчасно замовлення.

 --1.9. Формувати і переглядати відомості про попит на продукцію.
	select 
	TypeProduct.nameProduct[Pasta],Pasta.productClass[Class],
	Pasta.productionDate[Production date],TypeOfFlour.typeFlour[TypeOfFlour],
	Pasta.priceProduct*numberOfItems[numberOfItems], Pasta.implementationPhase[implementation phase],
	ProductOrder.numberOfItems[Number Of Items]
	from ProductOrder
	inner join Pasta on ProductOrder.pasta = Pasta.ID
	inner join TypeProduct on Pasta.typeProduct = typeProduct.ID
	inner join RawMaterial on Pasta.rawMaterial = RawMaterial.ID
	inner join TypeOfFlour on RawMaterial.flour = TypeOfFlour.ID
	where Pasta.implementationPhase = 'sold'
	order by ProductOrder.numberOfItems desc 

 --2.1. Формувати і переглядати відомості про наявність сировини на певний момент часу.
	Select TypeOfFlour.typeFlour[Type flour],RawMaterial.amountOfFlour[Amount flour]
	from RawMaterial
	inner join TypeOfFlour on RawMaterial.flour = TypeOfFlour.ID
	
 --2.2. Формувати і переглядати відомості про обсяги виробництва за вказаний період.	
 Select 
  TypeProduct.nameProduct[Pasta],Pasta.productClass[Class],
 Pasta.productionDate[Production date],TypeOfFlour.typeFlour[TypeOfFlour],
 Pasta.priceProduct[Price], Pasta.implementationPhase[implementation phase] 
 from Pasta 
 inner join TypeProduct on Pasta.typeProduct = typeProduct.ID
 inner join RawMaterial on Pasta.rawMaterial = RawMaterial.ID
 inner join TypeOfFlour on RawMaterial.flour = TypeOfFlour.ID
 where Pasta.productionDate between '2019-09-05' and '2019-10-25'