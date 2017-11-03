SELECT tag, COUNT(postid) 
FROM tags
JOIN posts_tags_map ON posts_tags_map.tags_tagid=tags.tagid
JOIN posts ON posts_tags_map.posts_postid=posts.postid
GROUP BY tag;