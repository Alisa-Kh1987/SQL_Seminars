-- 2. Предыдущую задачу решить с помощью процедуры

USE vk;
DROP PROCEDURE IF EXISTS delete_info_about_user;

DELIMITER //
CREATE PROCEDURE delete_info_about_user(us_id BIGINT UNSIGNED)
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

	END//
DELIMITER ;