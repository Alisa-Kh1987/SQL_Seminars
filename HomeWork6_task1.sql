/* 1. Используя транзакцию, написать функцию, которая удаляет всю информацию об указанном пользователе из БД vk. 
Пользователь задается по id. Удалить нужно все сообщения, лайки, медиа записи, профиль и запись из таблицы users. 
Функция должна возвращать номер пользователя. */

USE vk;
START TRANSACTION;
	DROP FUNCTION IF EXISTS delete_info_about_user;
	DELIMITER //
	CREATE FUNCTION delete_info_about_user(us_id BIGINT UNSIGNED)
    RETURNS BIGINT READS SQL DATA
		BEGIN
			DELETE FROM friend_requests WHERE friend_requests.initiator_user_id = us_id;   
			DELETE FROM friend_requests WHERE friend_requests.target_user_id = us_id;   
			DELETE FROM likes WHERE likes.user_id = us_id;                                 
            DELETE FROM media WHERE media.user_id = us_id; 
			DELETE FROM messages WHERE messages.from_user_id = us_id;                      
			DELETE FROM messages WHERE messages.to_user_id = us_id;                        
            DELETE FROM `profiles` WHERE `profiles`.user_id = us_id;
            DELETE FROM users_communities WHERE users_communities.user_id = us_id;        
            DELETE FROM `users` WHERE `users`.id = us_id;                                  
            
            RETURN this_user_id; 
        END//
	DELIMITER ;
COMMIT;

-- 