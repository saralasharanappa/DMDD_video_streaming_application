------------------------This view can show each user's data.
CREATE OR REPLACE VIEW app_user_view AS
SELECT
  id,
  first_name,
  last_name,
  username,
  dob,
  email
FROM app_user;


select * from app_user_view;

----------------------------This view can show each user's preferred genres.


CREATE OR REPLACE VIEW user_preference_view AS
SELECT
  u.id AS user_id,
  u.first_name,
  u.last_name,
  g.genre_name AS genrename
FROM user_preference p
JOIN app_user u ON p.user_id = u.id
JOIN genre g ON p.genre_id = g.id;

select * from user_preference_view;

------------------------------------------ This view can show the users favorite content 


CREATE OR REPLACE VIEW user_favorite_content AS
SELECT DISTINCT
    u.id AS user_id,
    u.username,
    f.id AS favorite_content_id,
    f.tv_show_id,
    f.movie_id
FROM
    app_user u
    JOIN favorite_content f ON u.id = f.user_id;



Select * from user_favorite_content;

----------------------------------- This view can provide a list of movies along with their associated genres.


CREATE OR REPLACE VIEW movie_genres AS
SELECT
    m.movie_title,
    m.movie_desc,
    g.genre_name
FROM
    movie m
    JOIN content_genre cg ON m.id = cg.movie_id
    JOIN genre g ON cg.genre_id = g.id;
    
Select * from movie_genres;    


--------------------------This view can display TV shows along with their associated episodes.


CREATE OR REPLACE VIEW tv_show_episodes AS
SELECT
    t.show_title,
    t.show_desc,
    e.id AS episode_id,
    e.episode_title,
    e.episode_desc
FROM
    tv_show t
    JOIN episode e ON t.id = e.tv_show_id;

Select * from tv_show_episodes;

-------------------This view can display production companies and the TV shows or movies they have produced.

CREATE OR REPLACE VIEW production_company_productions AS
SELECT
    pc.company_name,
    pc.headquarters,
    M.movie_title,
    t.show_title,
    COALESCE(t.show_title, m.movie_title) AS production_title
FROM
    production_co pc
    LEFT JOIN tv_show t ON pc.id = t.production_co_id
    LEFT JOIN movie m ON pc.id = m.production_co_id;
    
Select * from production_company_productions;


------------------------------ This view can display the Tv shows and movies  based on the genre associated

CREATE OR REPLACE VIEW genre_media_view AS
SELECT DISTINCT
    g.genre_name,
    CASE
        WHEN c.tv_show_id IS NOT NULL THEN 'TV Show'
        WHEN c.movie_id IS NOT NULL THEN 'Movie'
    END AS media_type,
    CASE
        WHEN c.tv_show_id IS NOT NULL THEN t.show_title
        WHEN c.movie_id IS NOT NULL THEN m.movie_title
    END AS media_title
FROM
    content_genre c
    JOIN genre g ON c.genre_id = g.id
    LEFT JOIN tv_show t ON c.tv_show_id = t.id
    LEFT JOIN movie m ON c.movie_id = m.id;
    
SELECT * FROM genre_media_view;
    

---------------------

CREATE OR REPLACE VIEW all_media AS
SELECT
    'Movie' AS type,
    m.id AS media_id,
    m.movie_title AS title,
    m.movie_release_yr AS release_year,
    m.movie_explicit_content AS explicit_content,
    g.genre_name
FROM
    movie m
    JOIN content_genre cg ON m.id = cg.movie_id
    JOIN genre g ON cg.genre_id = g.id

UNION

SELECT
    'TV Show' AS type,
    t.id AS media_id,
    t.show_title AS title,
    t.show_release_yr AS release_year,
    t.show_explicit_content AS explicit_content,
    g.genre_name
FROM
    tv_show t
    JOIN content_genre cg ON t.id = cg.tv_show_id
    JOIN genre g ON cg.genre_id = g.id;



SELECT * FROM all_media WHERE type = 'TV Show';
SELECT * FROM all_media WHERE type = 'Movie';
SELECT * FROM all_media WHERE release_year = '2019';

--------This view blocks the users below the age of 18 from viewing the explicit content 

CREATE OR REPLACE VIEW restricted_content AS
SELECT u.id as user_id,
    m.id AS media_id,
    CASE
        WHEN u.dob > SYSDATE - INTERVAL '18' YEAR AND m.movie_explicit_content = 'Y' THEN 'Blocked'
        WHEN u.dob > SYSDATE - INTERVAL '18' YEAR AND t.show_explicit_content = 'Y' THEN 'Blocked'
        ELSE 'Not Blocked'
    END AS block_status
FROM
    movie m
    FULL OUTER JOIN tv_show t ON m.id = t.id
    CROSS JOIN app_user u
WHERE
    (u.dob > SYSDATE - INTERVAL '18' YEAR AND m.movie_explicit_content = 'Y')
    OR (u.dob > SYSDATE - INTERVAL '18' YEAR AND t.show_explicit_content = 'Y');


SELECT * FROM restricted_content
WHERE user_id = (SELECT id FROM app_user WHERE username = 'danield');

--------This view blocks the users below the age of 18 from adding explicit content to their favorites 


