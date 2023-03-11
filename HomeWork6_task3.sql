/* 3*Написать триггер, который проверяет новое появляющееся сообщество. 
Длина названия сообщества (поле name) должна быть не менее 5 символов. 
Если требование не выполнено, то выбрасывать исключение с пояснением. */

USE vk;

DROP TRIGGER IF EXISTS new_community;
DELIMITER //

CREATE TRIGGER new_community
BEFORE INSERT 
ON communities FOR EACH ROW
begin
    IF LENGTH(new.name) < 5 THEN
        SIGNAL SQLSTATE '45000'
		SET MESSAGE_TEXT = 'Ошибка! Длина наименования сообщества должна быть не менее 5 символов';
    END IF;
END//

DELIMITER ;

INSERT INTO communities (name)
		  VALUES ('new_');