/*
1. Создайте таблицу с мобильными телефонами, используя графический интерфейс. 
Необходимые поля таблицы: product_name (название товара), manufacturer (производитель), product_count (количество), price (цена). 
Заполните БД произвольными данными.
*/
USE `mobile_phones_schema` ;
CREATE TABLE `mobile_phones_schema`.`phones_table` (
  `idphones_table` INT NOT NULL AUTO_INCREMENT,
  `Product_name` VARCHAR(45) NOT NULL,
  `Manufacturer` VARCHAR(45) NOT NULL,
  `Product_count` INT NOT NULL,
  `Price` INT NOT NULL,
  PRIMARY KEY (`idphones_table`),
  UNIQUE INDEX `Product_name_UNIQUE` (`Product_name` ASC) VISIBLE);
INSERT INTO `mobile_phones_schema`.`phones_table` (`Product_name`, `Manufacturer`, `Product_count`, `Price`) VALUES ('Samsung Galaxy S20', 'Samsung', '22', '45000');
INSERT INTO `mobile_phones_schema`.`phones_table` (`Product_name`, `Manufacturer`, `Product_count`, `Price`) VALUES ('Samsung Galaxy J7', 'Samsung', '2', '15000');
INSERT INTO `mobile_phones_schema`.`phones_table` (`Product_name`, `Manufacturer`, `Product_count`, `Price`) VALUES ('Iphone12', 'Apple', '8', '60000');
INSERT INTO `mobile_phones_schema`.`phones_table` (`Product_name`, `Manufacturer`, `Product_count`, `Price`) VALUES ('Iphone14', 'Apple', '14', '71000');
INSERT INTO `mobile_phones_schema`.`phones_table` (`Product_name`, `Manufacturer`, `Product_count`, `Price`) VALUES ('Nokia3310', 'Nokia', '1', '7000');
INSERT INTO `mobile_phones_schema`.`phones_table` (`Product_name`, `Manufacturer`, `Product_count`, `Price`) VALUES ('Redmi Note X10', 'Xiaomi', '15', '17000');
INSERT INTO `mobile_phones_schema`.`phones_table` (`Product_name`, `Manufacturer`, `Product_count`, `Price`) VALUES ('Redmi Note 9', 'Xiaomi', '3', '12000');
INSERT INTO `mobile_phones_schema`.`phones_table` (`Product_name`, `Manufacturer`, `Product_count`, `Price`) VALUES ('Sony', 'Sony', '8', '10000');
INSERT INTO `mobile_phones_schema`.`phones_table` (`Product_name`, `Manufacturer`, `Product_count`, `Price`) VALUES ('Nokia 8 Pro', 'Nokia', '9', '20000');

-- 2. Выведите название, производителя и цену для товаров, количество которых превышает 2 (SQL - файл, скриншот, либо сам код)
SELECT Product_name, Manufacturer, Price FROM phones_table WHERE Product_count > 2;

-- 3. Выведите SELECT-запросом весь ассортимент товаров марки “Samsung”
SELECT * FROM phones_table WHERE Manufacturer = 'Samsung';

/*
4.* С помощью SELECT-запроса с оператором LIKE / REGEXP найти:
4.1.* Товары, в которых есть упоминание "Iphone"
*/
SELECT * FROM phones_table WHERE Product_name LIKE '%iPhone%';


-- 4.2.* Товары, в которых есть упоминание "Samsung"
SELECT * FROM phones_table WHERE Product_name LIKE '%Samsung%';

-- 4.3.* Товары, в названии которых есть ЦИФРЫ
SELECT * FROM phones_table WHERE Product_name REGEXP '[0-9]';

-- 4.4.* Товары, в названии которых есть ЦИФРА "8"
SELECT * FROM phones_table WHERE Product_name LIKE '%8%';