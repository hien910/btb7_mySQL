-- Bài tập 1: Lấy danh sách các bộ phim (films) thuộc thể loại “Action.”
select film.*, category.name from film
inner join film_category on film.film_id = film_category.film_id
inner join category on film_category.category_id = category.category_id
where category.name = 'Action';
-- Bài tập 2: Lấy danh sách các bộ phim (films) và thể loại (categories) của chúng.
select film.*, category.name from film
inner join film_category on film.film_id = film_category.film_id
inner join category on film_category.category_id = category.category_id;

-- Bài tập 3: Lấy danh sách các bộ phim (films) và số lượng thể loại (categories) của mỗi bộ phim.
select category.* , count(category.category_id)as numOfMovies from category
inner join film_category on category.category_id = film_category.category_id
group by category_id;

-- Bài tập 4: Lấy danh sách các bộ phim (films) và thể loại (categories) của bộ phim có rating “PG-13.”
select film.*, category.name from film
inner join film_category on film.film_id = film_category.film_id
inner join category on film_category.category_id = category.category_id
where film.rating = 'PG-13';

-- Bài tập 5: Lấy danh sách các diễn viên (actors) và số lượng bộ phim (films) thuộc thể loại “Family,” sắp xếp theo số lượng bộ phim giảm dần
select category.name, actor.* ,count(actor.actor_id) as numOfMovies from actor
inner join film_actor on actor.actor_id = film_actor.actor_id
inner join film on film_actor.film_id = film.film_id
inner join film_category on film.film_id = film_category.film_id
inner join category on film_category.category_id = category.category_id
where category.name = 'Family'
group by actor.actor_id
order by numOfMovies DESC;

-- Bài tập 6: Lấy danh sách các bộ phim (films) và số lượng diễn viên (actors) tham gia, sắp xếp theo số lượng diễn viên giảm dần.
select film.* , count(*) as num_of_participants from actor
inner join film_actor on actor.actor_id = film_actor.actor_id
inner join film on film_actor.film_id = film.film_id
group by film_id
order by num_of_participants DESC;

-- Bài tập 7: Lấy danh sách tất cả diễn viên (actors) có họ là “Smith” và tên bắt đầu bằng “J.”
select actor.* from actor
where actor.first_name = 'SMITH' and actor.last_name like 'J%';

-- Bài tập 8: Lấy danh sách các bộ phim (films) phát hành trong năm 2015 với tổng doanh thu (revenue) lớn hơn 5000.
select * , sum(rental_rate* rental_duration) as revenue from film
where release_year = 2015
group by film_id 
having revenue > 5000;

-- Bài tập 9: Lấy danh sách bộ phim (films) và ngôn ngữ (language) của từng bộ phim.
select *, language.name as language from film 
inner join language on film.language_id = language.language_id;

-- Bài tập 10. Lấy danh sách bộ phim có tên(title) bắt đầu bằng chữ ‘I’ và kết thúc bằng chữ N
select * from film 
where title like 'I%N';
