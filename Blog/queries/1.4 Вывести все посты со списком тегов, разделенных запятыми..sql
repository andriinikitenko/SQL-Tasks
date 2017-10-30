select posts.idposts as Id, posts.text as Post, group_concat(tags.tag) as 'Tags' From posts inner join conection 
on posts.idposts = conection.posts_idposts
left join tags on conection.tags_idtags = tags.idtags group by posts.text DESC;
