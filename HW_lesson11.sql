/*Создайте таблицу logs типа Archive. 
Пусть при каждом создании записи в таблицах users, catalogs и products в таблицу logs помещается время и дата создания записи, 
название таблицы, идентификатор первичного ключа и содержимое поля name.*/
CREATE TABLE `shop`.`logs` (
  `apdate_at` DATETIME NOT NULL,
  `tbl_name` VARCHAR(45) NOT NULL,
  `id` BIGINT NOT NULL,
  `description_name` VARCHAR(245) NOT NULL)
ENGINE = ARCHIVE;

-- для USERS
DROP TRIGGER IF EXISTS `shop`.`users_AFTER_INSERT`;
DELIMITER $$
USE `vk`$$
CREATE DEFINER = CURRENT_USER TRIGGER `shop`.`users_AFTER_INSERT` AFTER INSERT ON `users` FOR EACH ROW
BEGIN
	insert into `shop`.`logs` (apdate_at,tbl_name,id,description_name)
    values (now(), `users`, new.id, new.name);
END$$
DELIMITER ;

-- для catalogs
DROP TRIGGER IF EXISTS `shop`.`catalogs_AFTER_INSERT`;
DELIMITER $$
USE `shop`$$
CREATE DEFINER=`root`@`localhost` TRIGGER `catalogs_AFTER_INSERT` AFTER INSERT ON `catalogs` FOR EACH ROW 
BEGIN
insert into `shop`.`logs` (apdate_at, tbl_name, id, description_name)
    values (now(), `catalogs`, new.id, new.name);
END$$
DELIMITER ;

-- для products
DROP TRIGGER IF EXISTS `shop`.`products_AFTER_INSERT`;
DELIMITER $$
USE `shop`$$
CREATE DEFINER = CURRENT_USER TRIGGER `shop`.`products_AFTER_INSERT` AFTER INSERT ON `products` FOR EACH ROW
BEGIN
 insert into `shop`.`logs` (apdate_at, tbl_name, id, description_name)
    values (now(), `products`, new.id, new.name);
END$$
DELIMITER ;


/*Создайте SQL-запрос, который помещает в таблицу users миллион записей.*/
USE `shop`;
DROP procedure IF EXISTS `insert_one_million`;
DELIMITER $$
USE `shop`$$
CREATE PROCEDURE `insert_one_million` ()
BEGIN
 declare i int default 10;
 declare j int default 0;
 while i> 100 do
	insert into `test` values(j, now());
	set i =i-1;
        set j=j+1;
 end while;
END$$
DELIMITER ;
				  
				  
/*В базе данных Redis подберите коллекцию для подсчета посещений с определенных IP-адресов*/


/*При помощи базы данных Redis решите задачу поиска имени пользователя по электронному адресу и наоборот, поиск электронного адреса пользователя по его имени.*/


/*Организуйте хранение категорий и товарных позиций учебной базы данных shop в СУБД MongoDB.*/
