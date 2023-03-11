USE VK;

-- 1. Создайте представление с произвольным SELECT-запросом из прошлых уроков [CREATE VIEW]
-- Подсчитать общее количество лайков, которые получили пользователи младше 18 лет (из ДЗ № 4)
CREATE OR REPLACE VIEW likes_less_18 AS
	SELECT COUNT(likes.id) AS count_of_likes
FROM likes
INNER JOIN media AS m ON m.id = likes.media_id
INNER JOIN profiles AS p ON p.user_id = m.user_id
WHERE (birthday + INTERVAL 18 YEAR) > NOW()
ORDER BY m.user_id;
    
-- 2. Выведите данные, используя написанное представление [SELECT]

SELECT * FROM likes_less_18;

-- 3. Удалите представление [DROP VIEW]

DROP VIEW likes_less_18;

-- 4* Сколько новостей (записей в таблице media) у каждого пользователя? 
-- Вывести поля: news_count (количество новостей), user_id (номер пользователя),
-- user_email (email пользователя). Попробовать решить с помощью CTE или с помощью обычного JOIN.

-- JOIM  

SELECT m.user_id, COUNT(m.user_id) as news_count, u.email
FROM media AS m
INNER JOIN users AS u ON  m.user_id = u.id
GROUP BY user_id
ORDER BY user_id;