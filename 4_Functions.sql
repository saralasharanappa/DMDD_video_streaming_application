SET SERVEROUTPUT ON;

-----------------GET THE COUNT OF EPISODES IN A TV SHOW-----------------------
CREATE OR REPLACE FUNCTION count_episodes(tv_show_id IN tv_show.id%TYPE) 
RETURN NUMBER IS 
    episodes_count NUMBER;
BEGIN
    SELECT COUNT(*)
    INTO episodes_count
    FROM episode
    WHERE tv_show_id = tv_show_id;
    
    RETURN episodes_count;
EXCEPTION
    WHEN OTHERS THEN
        RAISE_APPLICATION_ERROR(-20000, 'Error counting episodes: ' || SQLERRM);
END count_episodes;
/

---------------------GET LATEST MOVIE-----------------------
CREATE OR REPLACE FUNCTION get_latest_movie RETURN movie%ROWTYPE IS 
    latest_movie movie%ROWTYPE;
BEGIN
    SELECT *
    INTO latest_movie
    FROM movie
    ORDER BY movie_release_yr DESC
    FETCH FIRST 1 ROW ONLY;
    
    RETURN latest_movie;
EXCEPTION
    WHEN NO_DATA_FOUND THEN
        RAISE_APPLICATION_ERROR(-20001, 'No movies found.');
    WHEN OTHERS THEN
        RAISE_APPLICATION_ERROR(-20002, 'Error fetching latest movie: ' || SQLERRM);
END get_latest_movie;
/

---------------------CHECK USER PREFERENCE-----------------------
CREATE OR REPLACE FUNCTION has_genre_preference(user_id IN app_user.id%TYPE, genre_id IN genre.id%TYPE) 
RETURN BOOLEAN IS 
    preference_count NUMBER;
BEGIN
    SELECT COUNT(*)
    INTO preference_count
    FROM user_preference
    WHERE user_id = user_id AND genre_id = genre_id;
    
    RETURN (preference_count > 0);
EXCEPTION
    WHEN OTHERS THEN
        RAISE_APPLICATION_ERROR(-20003, 'Error checking genre preference: ' || SQLERRM);
END has_genre_preference;
/

---------------------GET LIST OF GENRES FOR TV SHOW-----------------------
CREATE OR REPLACE FUNCTION get_tv_show_genres(tv_show_id IN tv_show.id%TYPE) 
RETURN VARCHAR2 IS 
    genres_list VARCHAR2(4000);
BEGIN
    SELECT LISTAGG(g.genre_name, ', ') WITHIN GROUP (ORDER BY g.genre_name)
    INTO genres_list
    FROM genre g
    JOIN content_genre cg ON g.id = cg.genre_id
    WHERE cg.tv_show_id = tv_show_id;
    
    RETURN genres_list;
EXCEPTION
    WHEN OTHERS THEN
        RAISE_APPLICATION_ERROR(-20004, 'Error retrieving genres for TV show: ' || SQLERRM);
END get_tv_show_genres;
/

---------------------GET PRODUCTION COMPANY INFORMATION-----------------------
CREATE OR REPLACE FUNCTION get_production_co_info(production_co_id IN production_co.id%TYPE) 
RETURN production_co%ROWTYPE IS 
    production_info production_co%ROWTYPE;
BEGIN
    SELECT *
    INTO production_info
    FROM production_co
    WHERE id = production_co_id;
    
    RETURN production_info;
EXCEPTION
    WHEN NO_DATA_FOUND THEN
        RAISE_APPLICATION_ERROR(-20005, 'Production company not found.');
    WHEN OTHERS THEN
        RAISE_APPLICATION_ERROR(-20006, 'Error retrieving production company information: ' || SQLERRM);
END get_production_co_info;
/

---------------------GET TOTAL NUMBER OF SHOWS BY COMPANY-----------------------
CREATE OR REPLACE FUNCTION get_total_shows_by_company(p_production_co_id IN production_co.id%TYPE) 
RETURN NUMBER IS 
    total_shows NUMBER;
BEGIN
    SELECT COUNT(*) INTO total_shows
    FROM tv_show
    WHERE production_co_id = p_production_co_id;
    
    RETURN total_shows;
EXCEPTION
    WHEN OTHERS THEN
        RAISE_APPLICATION_ERROR(-20008, 'Error retrieving total shows: ' || SQLERRM);
END get_total_shows_by_company;
/

---------------------GET TV SHOW OR MOVIE ACCORDING TO GENRE-----------------------
CREATE OR REPLACE FUNCTION get_titles_by_genre(p_genre_id IN genre.id%TYPE) 
RETURN VARCHAR2 IS 
    titles_list VARCHAR2(4000); -- This holds the concatenated list of titles
    
    -- Cursors to fetch movie and TV show titles for the specified genre
    CURSOR c_movies IS 
        SELECT m.movie_title
        FROM movie m
        JOIN content_genre cg ON cg.movie_id = m.id
        WHERE cg.genre_id = p_genre_id;

    CURSOR c_tv_shows IS 
        SELECT tv.show_title
        FROM tv_show tv
        JOIN content_genre cg ON cg.tv_show_id = tv.id
        WHERE cg.genre_id = p_genre_id;

BEGIN
    -- Initialize the list
    titles_list := '';

    -- Fetch movies for the genre and concatenate to the list
    FOR movie_rec IN c_movies LOOP
        titles_list := titles_list || 'Movie: ' || movie_rec.movie_title || '; ';
    END LOOP;
    
    -- Fetch TV shows for the genre and concatenate to the list
    FOR tv_show_rec IN c_tv_shows LOOP
        titles_list := titles_list || 'TV Show: ' || tv_show_rec.show_title || '; ';
    END LOOP;

    -- Remove the final semicolon and space if the list is not empty
    IF LENGTH(titles_list) > 0 THEN
        titles_list := RTRIM(titles_list, '; ');
    END IF;

    RETURN titles_list;
EXCEPTION
    WHEN OTHERS THEN
        RAISE_APPLICATION_ERROR(-20012, 'An error occurred retrieving titles: ' || SQLERRM);
END get_titles_by_genre;
/

---------------------GET TVSHOW/MOVIE RECOMMENDATION ACCORDING TO POPULAR GENRE-----------------------
CREATE OR REPLACE FUNCTION recommend_content (user_id IN app_user.id%TYPE) 
RETURN VARCHAR2 IS 
    recommended_title VARCHAR2(4000);
    popular_genre_id genre.id%TYPE;

    -- Cursor to get the most popular genre (most occurrences in content_genre table)
    CURSOR c_popular_genre IS
        SELECT genre_id
        FROM (
            SELECT genre_id, COUNT(*) as cnt
            FROM content_genre
            GROUP BY genre_id
            ORDER BY cnt DESC
        ) WHERE ROWNUM = 1;

    -- Cursor to get a recommendation from the most popular genre
    CURSOR c_recommendation(p_genre_id IN genre.id%TYPE) IS
        SELECT 'TV Show: ' || show_title AS recommendation
        FROM tv_show
        WHERE id IN (
            SELECT tv_show_id
            FROM content_genre
            WHERE genre_id = p_genre_id
        ) AND ROWNUM = 1
        UNION
        SELECT 'Movie: ' || movie_title AS recommendation
        FROM movie
        WHERE id IN (
            SELECT movie_id
            FROM content_genre
            WHERE genre_id = p_genre_id
        ) AND ROWNUM = 1;
BEGIN
    -- Find the most popular genre
    OPEN c_popular_genre;
    FETCH c_popular_genre INTO popular_genre_id;
    CLOSE c_popular_genre;

    -- If we found a popular genre, get a recommendation
    IF popular_genre_id IS NOT NULL THEN
        OPEN c_recommendation(popular_genre_id);
        FETCH c_recommendation INTO recommended_title;
        CLOSE c_recommendation;

        -- If we got a recommendation, return it
        IF recommended_title IS NOT NULL THEN
            RETURN recommended_title;
        ELSE
            RETURN 'No recommendation found.';
        END IF;
    ELSE
        RETURN 'No popular genres found.';
    END IF;
EXCEPTION
    WHEN OTHERS THEN
        RAISE_APPLICATION_ERROR(-20013, 'An error occurred during the recommendation process: ' || SQLERRM);
END recommend_content;
/
--SELECT recommend_content(1) AS recommendation FROM dual;

------------GET THE TOP 5 TV SHOW, EPISODES AND MOVIES BASED ON USER PREFERENCES --------- 

         --  Get the list of top 5 movies preffered by user --
CREATE OR REPLACE FUNCTION get_top_preferred_movies RETURN SYS_REFCURSOR AS
    top_movies_cursor SYS_REFCURSOR;
    v_movie_count NUMBER;
BEGIN
    SELECT COUNT(*) INTO v_movie_count FROM movie m;

    IF v_movie_count = 0 THEN
        RAISE_APPLICATION_ERROR(-20001, 'No movies found.');
    ELSE
        OPEN top_movies_cursor FOR
        SELECT
            m.movie_title,
            COUNT(up.id) AS preference_count
        FROM
            movie m
        JOIN
            favorite_content f ON m.id = f.movie_id
        JOIN
            user_preference up ON m.id = up.genre_id
        GROUP BY
            m.movie_title
        ORDER BY
            preference_count DESC
        FETCH FIRST 5 ROWS ONLY;

        RETURN top_movies_cursor;
    END IF;
END get_top_preferred_movies;
/

         --  Get the list of top 5 tv shows preffered by user --

CREATE OR REPLACE FUNCTION get_top_preferred_tv_shows RETURN SYS_REFCURSOR AS
    top_tv_shows_cursor SYS_REFCURSOR;
    v_tvshow_count NUMBER;
BEGIN
    SELECT COUNT(*) INTO v_tvshow_count FROM tv_show t;

    IF v_tvshow_count = 0 THEN
        RAISE_APPLICATION_ERROR(-20001, 'No TV shows found.');
    ELSE
        OPEN top_tv_shows_cursor FOR
        SELECT
            t.show_title,
            COUNT(up.id) AS preference_count
        FROM
            tv_show t
        JOIN
            favorite_content f ON t.id = f.tv_show_id
        JOIN
            user_preference up ON t.id = up.genre_id
        GROUP BY
            t.show_title
        ORDER BY
            preference_count DESC
        FETCH FIRST 5 ROWS ONLY;

        RETURN top_tv_shows_cursor;
    END IF;
END get_top_preferred_tv_shows;
/

         --  Get the list of most preffered  content by user based --

CREATE OR REPLACE FUNCTION get_most_preferred_content RETURN SYS_REFCURSOR AS
    most_preferred_content_cursor SYS_REFCURSOR;
    v_prefered_count NUMBER;
BEGIN
    SELECT COUNT(*) INTO v_prefered_count FROM favorite_content;

    IF v_prefered_count = 0 THEN
        RAISE_APPLICATION_ERROR(-20001, 'No preferred content found.');
    ELSE
        OPEN most_preferred_content_cursor FOR
        SELECT
            f.id AS favorite_content_id,
            m.movie_title,
            t.show_title,
            f.user_id
        FROM
            favorite_content f
        LEFT JOIN
            movie m ON f.movie_id = m.id
        LEFT JOIN
            tv_show t ON f.tv_show_id = t.id;

        RETURN most_preferred_content_cursor;
    END IF;
END get_most_preferred_content;
/
            --  Get the list of most liked genres by the user --

CREATE OR REPLACE FUNCTION get_most_liked_genres RETURN SYS_REFCURSOR AS
    most_liked_genres_cursor SYS_REFCURSOR;
    v_genre_count NUMBER;
BEGIN
    SELECT COUNT(*) INTO v_genre_count FROM user_preference;

    IF v_genre_count = 0 THEN
        RAISE_APPLICATION_ERROR(-20001, 'No liked genres found.');
    ELSE
        OPEN most_liked_genres_cursor FOR
        SELECT
            g.genre_name,
            COUNT(up.id) AS like_count
        FROM
            genre g
        JOIN
            user_preference up ON g.id = up.genre_id
        GROUP BY
            g.genre_name
        ORDER BY
            like_count DESC
        FETCH FIRST 5 ROWS ONLY;

        RETURN most_liked_genres_cursor;
    END IF;
END get_most_liked_genres;
/