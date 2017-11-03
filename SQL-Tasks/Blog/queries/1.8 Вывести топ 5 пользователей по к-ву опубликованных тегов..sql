
select authors.authorid, name, title, count(tags_tagid) from authors
inner join posts on authors.authorid = posts.authors_authorid
inner join posts_tags_map on posts.postid = posts_tags_map.posts_postid
group by authors.authorid
order by count(tags_tagid) desc limit 5;