SELECT  title, text 
FROM posts
WHERE idposts NOT in (SELECT DISTINCT posts_idposts FROM conection);