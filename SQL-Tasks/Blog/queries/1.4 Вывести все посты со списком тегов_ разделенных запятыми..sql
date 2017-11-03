select posts.postid as Id, posts.title as Title, posts.text as Post, group_concat(tags.tag) as 'Tags' From posts inner join posts_tags_map 
on posts.postid = posts_tags_map.posts_postid
left join tags on posts_tags_map.tags_tagid = tags.tagid group by posts.postid DESC;