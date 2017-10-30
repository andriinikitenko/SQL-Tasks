select autors.idautors, name, count(tags_idtags) from autors
inner join posts on autors.idautors = posts.autors_idautors
inner join conection on posts.idposts = conection.posts_idposts
group by autors.idautors
order by count(tags_idtags) desc limit 5;