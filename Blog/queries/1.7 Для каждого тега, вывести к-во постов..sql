SELECT tag, COUNT(idposts) 
FROM tags
JOIN conection ON conection.tags_idtags=tags.idtags
JOIN posts ON conection.posts_idposts=posts.idposts
GROUP BY tag;