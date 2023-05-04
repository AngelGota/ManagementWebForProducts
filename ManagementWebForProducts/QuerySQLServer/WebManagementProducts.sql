-- ######################################################### --
-- ------- database created only for this repository ------- --
-- https://github.com/AngelGota/ManagementWebForProducts.git --
-- ######################################################### --

DROP DATABASE WebManagementProducts

CREATE DATABASE WebManagementProducts

USE WebManagementProducts

-- Tables needed for this CRUD 
CREATE TABLE Categories (
  idCategory INT PRIMARY KEY,
  detCategory VARCHAR(50)
);

INSERT INTO Categories VALUES (1, 'Ropa Elegante');
INSERT INTO Categories VALUES (2, 'Ropa Casual');
INSERT INTO Categories VALUES (3, 'Ropa Veraniega');
INSERT INTO Categories VALUES (4, 'Ropa Deportiva');
INSERT INTO Categories VALUES (5, 'Accesorios');

CREATE TABLE Products (
  idProduct INT PRIMARY KEY IDENTITY,
  namProduct VARCHAR(50),
  desProduct VARCHAR(100),
  priProduct DECIMAL(10,2),
  idCategory INT FOREIGN KEY REFERENCES Categories(idCategory)
);

INSERT INTO Products VALUES ('Camiseta', 'Camiseta de algodón para hombre', 19.99, 1);
INSERT INTO Products VALUES ('Vestido', 'Vestido de fiesta para mujer', 49.99, 2);
INSERT INTO Products VALUES ('Zapatos', 'Zapatos de cuero para hombre', 89.99, 1);
INSERT INTO Products VALUES ('Bolso', 'Bolso de mano para mujer', 29.99, 5);
INSERT INTO Products VALUES ('Reloj', 'Reloj de pulsera para hombre', 99.99, 5);

CREATE TABLE Users (
  idUser INT PRIMARY KEY,
  userName VARCHAR(50),
  userFullName VARCHAR(100),
  userMail VARCHAR(50),
  userPass VARCHAR(50)
);

-- Store procedures
CREATE OR ALTER PROCEDURE sp_read_products
(
@ID INT=0
)
AS
BEGIN
	SELECT *
	FROM Products
	WHERE idProduct = @ID or @ID = 0
END
GO

EXEC sp_read_products
GO


