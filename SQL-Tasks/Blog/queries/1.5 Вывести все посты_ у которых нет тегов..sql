SELECT  postid, title, text 
FROM posts
WHERE postid NOT in (SELECT DISTINCT posts_postid FROM posts_tags_map);