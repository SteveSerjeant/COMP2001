IF OBJECT_ID(N'dbo.Orders', N'U') IS NOT NULL 
BEGIN
	DROP TABLE dbo.Orders; 
END
CREATE TABLE dbo.Orders
(
    OrderId INT NOT NULL,
    OrderDate Date NOT NULL,
    Customer NVARCHAR(5) NOT NULL,

    CONSTRAINT pk_Orders PRIMARY KEY (OrderID)
);

INSERT INTO dbo.Orders (OrderId, OrderDate, Customer)
VALUES (1, '2019-06-22', '1');
INSERT INTO dbo.Orders (OrderId, OrderDate, Customer)
VALUES (2, '2019-07-22', '2');
INSERT INTO dbo.Orders (OrderId, OrderDate, Customer)
VALUES (3, '2019-08-22', '3');


IF OBJECT_ID(N'dbo.OrderDetails', N'U') IS NOT NULL 
BEGIN
	DROP TABLE dbo.OrderDetails; 
END

CREATE TABLE dbo.OrderDetails 
( 
    OrderId INT NOT NULL, 
    ProductId INT NOT NULL,     
    Quantity INT NOT NULL 
        CHECK(Quantity <> 0), 
CONSTRAINT PK_OrderDetails PRIMARY KEY (OrderId, ProductId) 
); 

INSERT INTO dbo.OrderDetails(OrderId, ProductId, Quantity)
VALUES(1, 1, 20);
INSERT INTO dbo.OrderDetails(OrderId, ProductId, Quantity)
VALUES(2, 2, 10);
INSERT INTO dbo.OrderDetails(OrderId, ProductId, Quantity)
VALUES(3, 3, 5);

IF OBJECT_ID(N'dbo.Products', N'U') IS NOT NULL 
BEGIN
	DROP TABLE dbo.Products; 
END

CREATE TABLE dbo.Products
(
	ProductId INT IDENTITY(1,1) not null,
	Product_Details VARCHAR (Max) not null,
	Price FLOAT not null,
	Quantity int not null,
	CONSTRAINT PK_Products PRIMARY KEY (ProductId)
);

INSERT INTO dbo.Products(Product_Details, Price, Quantity)
VALUES('Pens - Black biro',0.30, 200);
INSERT INTO dbo.Products(Product_Details, Price, Quantity)
VALUES('Pens - Green biro',0.30, 200);
INSERT INTO dbo.Products(Product_Details, Price, Quantity)
VALUES('Pens - Red biro',0.30, 200);

/*code to alter columns in Orders table*/

ALTER TABLE Orders 
ALTER COLUMN CustomerID INT NOT NULL;

sp_rename 'Orders.Customer', 'CustomerID', 'COLUMN';

select * from orders;

/*code to create Customer table */

IF OBJECT_ID(N'dbo.Customers', N'U') IS NOT NULL 
BEGIN
	DROP TABLE dbo.Customers; 
END

CREATE TABLE dbo.Customers
(
    CustomerID INT IDENTITY(1,1) NOT NULL,
    Cust_Name VARCHAR(30) NOT NULL,
    Cust_Addr1 VARCHAR (40) NOT NULL,
    Cust_Addr2 VARCHAR (40) NOT NULL,
    Cust_Postcode VARCHAR(10) NOT NULL,
    CONSTRAINT PK_Customers PRIMARY KEY (CustomerId)
);

ALTER TABLE Orders
ADD CONSTRAINT FK_Customers
FOREIGN KEY (CustomerID) 
REFERENCES Customers(CustomerID)
ON DELETE CASCADE;

ALTER TABLE Orders
DROP FK_Customers;

INSERT INTO Customers (Cust_Name, Cust_Addr1, Cust_Addr2, Cust_Postcode)
VALUES ('Acme Limited','1 Roadrunner Lane','Acmeville','AC1 1RR');
INSERT INTO Customers (Cust_Name, Cust_Addr1, Cust_Addr2, Cust_Postcode)
VALUES ('Parts R Us','21 Saltash Road','Plymouth','PL1 3PQ');
INSERT INTO Customers (Cust_Name, Cust_Addr1, Cust_Addr2, Cust_Postcode)
VALUES ('Partco','1b Buckingham Place','Exeter','EX5 4ZE');

SELECT * FROM OrderDetails;

ALTER TABLE OrderDetails
ADD UnitPrice DECIMAL(5,2);

DELETE FROM Customers
WHERE CustomerID = 3;

SELECT * FROM Customers;

SELECT * FROM Orders;

INSERT INTO dbo.Orders (OrderId, OrderDate, CustomerID)
VALUES (3, '2019-08-22', '4');
