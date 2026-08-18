
CREATE TABLE customer  (
	 customer_id VARCHAR(6) PRIMARY KEY ,
	 Custom_erName VARCHAR(30)  NOT NULL,
	 DateOfReg DATE ,
	 User_id VARCHAR(15) UNIQUE NOT NULL,
	 Password VARCHAR(15)   UNIQUE NOT  NULL,
	 CHECK(customer_id LIKE 'C%')
);

DROP TABLE BILL;


CREATE TABLE BankInfo (
	 AccountNo NUMERIC(10,0),
	 CustomerId VARCHAR(6) ,
	 PRIMARY KEY(accountNo,customerId),
	 FOREIGN KEY(CustomerId)
	 REFERENCES customer(customer_Id)
	 ON DELETE CASCADE
);


CREATE TABLE billing(
	  Billd NUMERIC(4,0) PRIMARY KEY,
	  AccountNo NUMERIC(10,0) ,
	  customerId VARCHAR(6) ,
	  FOREIGN KEY(accountno,customerid)
	  references bankInfo(AccountNo,customerid),
	  BillDate DATE DEFAULT CURRENT_DATE,
	  PaymentType VARCHAR(12) ,
	  CHECK(PaymentType IN('Credited','Debited'))
);

CREATE TABLE Item (
    ItemId VARCHAR(6) PRIMARY KEY,
    ItemName VARCHAR(30) NOT NULL,
    QtyOnHand NUMERIC(3,0),
    UnitPrice NUMERIC(6,2),
    Class CHAR(1),
    UnitOfMeasurement VARCHAR(12),
    ReOrderLevel NUMERIC(3,0),
    ReorderQty NUMERIC(3,0),
    Discount NUMERIC(2,0),

    CHECK (QtyOnHand > ReOrderLevel),
    CHECK (UnitPrice > 0),
    CHECK (ReOrderLevel > 0),
    CHECK (ReorderQty > 0),

    CHECK (
        Class = CASE
                    WHEN UnitPrice < 100 THEN 'A'
                    WHEN UnitPrice < 1000 THEN 'B'
                    WHEN UnitPrice >= 1000 THEN 'C'
                END
    )
);
