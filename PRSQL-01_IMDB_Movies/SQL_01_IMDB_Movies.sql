use project_movie_database;
-- a) Can you get all data about movies?
select * FROM movies;

-- b) How do you get all data about directors?
select * from directors;

-- c) Check how many movies are present in IMDB.
select count(*) as total_movies from movies;

-- d) Find these 3 directors: James Cameron ; Luc Besson ; John Woo
select * from directors where name = 'James Cameron'
or name = 'Luc Besson' 
or name = 'John Woo';

-- e) Find all directors with name starting with S.
select * from directors where name like 'S%';

-- f) Count female directors.
select count(*) as female_directors from directors where gender = 1;

-- g) Find the name of the 10th first women directors?
select name from directors where gender = 1 limit 1 offset 9;

-- h) What are the 3 most popular movies?
select * from movies order by popularity desc limit 3;

-- i) What are the 3 most bankable movies?
select * from movies order by revenue desc limit 3;

-- j) What is the most awarded average vote since the January 1st, 2000?
select title, vote_average from movies where release_date >= '2000-01-01' order by vote_average desc limit 1;

-- k) Which movie(s) were directed by Brenda Chapman?
select m.title from movies m join directors d on m.director_id = d.id where d.name = 'Brenda Chapman';

-- l) Which director made the most movies?
select d.name, count(*) as total_movies from directors d join movies m on d.id = m.director_id group by d.name order by total_movies desc limit 1;

-- m) Which director is the most bankable?
select d.name, sum(m.revenue) as total_revenue from directors d join movies m on d.id = m.director_id
group by d.name order by total_revenue desc limit 1;