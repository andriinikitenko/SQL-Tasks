SELECT posts.text FROM posts
 LEFT JOIN conection ON posts.idposts = conection.posts_idposts
WHERE conection.posts_idposts IS NULL 
GROUP BY posts.text;