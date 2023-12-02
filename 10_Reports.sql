--------------------  Reports -----------------------------

--  Get the list of top 5 movies preferred by user --
DECLARE
    top_movies_cursor SYS_REFCURSOR;
    v_report_title VARCHAR2(100);
BEGIN
 SELECT 'Report showing the top movies added by user' INTO v_report_title FROM dual;
   DBMS_OUTPUT.PUT_LINE('Report Title: ' || v_report_title);
    top_movies_cursor := get_top_preferred_movies;
    DBMS_SQL.RETURN_RESULT(top_movies_cursor);
END;
/

--  Get the list of top 5 TV shows preferred by user --
DECLARE
    top_tv_shows_cursor SYS_REFCURSOR;
    v_report_title VARCHAR2(100);
BEGIN
 SELECT 'Report showing the top tv shows added by user' INTO v_report_title FROM dual;
   DBMS_OUTPUT.PUT_LINE('Report Title: ' || v_report_title);
    top_tv_shows_cursor := get_top_preferred_tv_shows;
    DBMS_SQL.RETURN_RESULT(top_tv_shows_cursor);
END;
/

--  Get the list of most liked genres by the user --
DECLARE
    most_liked_genres_cursor SYS_REFCURSOR;
    v_report_title VARCHAR2(100);
BEGIN
 SELECT 'Report showing the most liked genres' INTO v_report_title FROM dual;
   DBMS_OUTPUT.PUT_LINE('Report Title: ' || v_report_title);
    most_liked_genres_cursor := get_most_liked_genres;
    DBMS_SQL.RETURN_RESULT(most_liked_genres_cursor);
END;
/

--  Report for the Latest Movie released --
DECLARE
    latest_movie_info movie%ROWTYPE;
    v_report_title VARCHAR2(100);
BEGIN
    SELECT 'Report for the Latest Movie' INTO v_report_title FROM dual;
    DBMS_OUTPUT.PUT_LINE('Report Title: ' || v_report_title);

    latest_movie_info := get_latest_movie;

    IF latest_movie_info.id IS NOT NULL THEN
        DBMS_OUTPUT.PUT_LINE('Latest Movie Title: ' || latest_movie_info.movie_title);
        DBMS_OUTPUT.PUT_LINE('Release Year: ' || latest_movie_info.movie_release_yr);
        -- Add more details as needed
    ELSE
        DBMS_OUTPUT.PUT_LINE('No latest movie found.');
    END IF;
END;
/

DECLARE
    v_production_co_id production_co.id%TYPE := 2;
    v_total_shows NUMBER;
BEGIN
    v_total_shows := get_total_shows_by_company(v_production_co_id);
    DBMS_OUTPUT.PUT_LINE('Total Shows by Company (ID ' || v_production_co_id || '): ' || v_total_shows);
END;
/

DECLARE
    tv_show_id_param tv_show.id%TYPE := 3;
    genres_list VARCHAR2(200);
    episodes_count NUMBER;
BEGIN
    -- Get TV show genres
    genres_list := get_tv_show_genres(tv_show_id_param);

    -- Get number of episodes
    episodes_count := count_episodes(tv_show_id_param);

    -- Display the report
    DBMS_OUTPUT.PUT_LINE('TV Show ID: ' || tv_show_id_param);
    DBMS_OUTPUT.PUT_LINE('Number of Episodes: ' || episodes_count);
END;
/

DECLARE
    tv_show_id_param tv_show.id%TYPE := 3;

    episodes_count NUMBER;
BEGIN
    episodes_count := count_episodes(tv_show_id_param);

    DBMS_OUTPUT.PUT_LINE('TV Show ID: ' || tv_show_id_param);
    DBMS_OUTPUT.PUT_LINE('Number of Episodes: ' || episodes_count);
END;
/


-- Report for Recommended Content
DECLARE
    recommended_content VARCHAR2(4000);
    v_report_title VARCHAR2(100);
BEGIN
    SELECT 'Report for Recommended Content' INTO v_report_title FROM dual;
    DBMS_OUTPUT.PUT_LINE('Report Title: ' || v_report_title);

    recommended_content := recommend_content(1);

    IF recommended_content IS NOT NULL THEN
        DBMS_OUTPUT.PUT_LINE('Recommended Content: ' || recommended_content);
    ELSE
        DBMS_OUTPUT.PUT_LINE('No recommendation found.');
    END IF;
END;
/