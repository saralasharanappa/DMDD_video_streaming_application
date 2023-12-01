-- Insert production company data into production_co table
CREATE OR REPLACE PROCEDURE insert_into_production_co (
    p_company_name IN production_co.company_name%TYPE,
    p_headquarters IN production_co.headquarters%TYPE
) IS
BEGIN
    INSERT INTO production_co (
        company_name,
        headquarters
    ) VALUES (
        p_company_name,
        p_headquarters
    );

    COMMIT; -- Optional: Commit the transaction if needed
EXCEPTION
    WHEN dup_val_on_index THEN
        raise_application_error(-20001, 'Duplicate combination of company name and headquarters not allowed.');
END;
/

CREATE OR REPLACE PROCEDURE insert_into_content_genre (
    p_genre_id   IN content_genre.genre_id%TYPE,
    p_tv_show_id IN content_genre.tv_show_id%TYPE,
    p_movie_id   IN content_genre.movie_id%TYPE
) IS
BEGIN
    -- Check if either tv_show_id or movie_id is provided, but not both
    IF (
        p_tv_show_id IS NOT NULL
        AND p_movie_id IS NULL
    ) OR (
        p_tv_show_id IS NULL
        AND p_movie_id IS NOT NULL
    ) THEN
        INSERT INTO content_genre (
            id,
            genre_id,
            tv_show_id,
            movie_id
        ) VALUES (
            content_genre_seq.NEXTVAL,
            p_genre_id,
            p_tv_show_id,
            p_movie_id
        );

    ELSE
        raise_application_error(-20001, 'Either tv_show_id or movie_id must be provided, but not both.');
    END IF;
EXCEPTION
    WHEN dup_val_on_index THEN
        raise_application_error(-20002, 'Duplicate combination of genre, tv_show and movie not allowed.');
END;
/

CREATE OR REPLACE PROCEDURE insert_into_episode (
    p_episode_title IN episode.episode_title%TYPE,
    p_episode_desc  IN episode.episode_desc%TYPE,
    p_season_no     IN episode.season_no%TYPE,
    p_episode_count IN episode.episode_count%TYPE,
    p_tv_show_id    IN episode.tv_show_id%TYPE
) IS
BEGIN
    INSERT INTO episode (
        id,
        episode_title,
        episode_desc,
        season_no,
        episode_count,
        tv_show_id
    ) VALUES (
        episode_seq.NEXTVAL,
        p_episode_title,
        p_episode_desc,
        p_season_no,
        p_episode_count,
        p_tv_show_id
    );

EXCEPTION
    WHEN dup_val_on_index THEN
        raise_application_error(-20002, 'Duplicate episode title not allowed.');
END;
/

CREATE OR REPLACE PROCEDURE insert_into_favorite_content (
    p_user_id    IN favorite_content.user_id%TYPE,
    p_tv_show_id IN favorite_content.tv_show_id%TYPE,
    p_movie_id   IN favorite_content.movie_id%TYPE
) IS
BEGIN
    -- Check if either tv_show_id or movie_id is provided, but not both
    IF (
        p_tv_show_id IS NOT NULL
        AND p_movie_id IS NULL
    ) OR (
        p_tv_show_id IS NULL
        AND p_movie_id IS NOT NULL
    ) THEN
        INSERT INTO favorite_content (
            id,
            user_id,
            tv_show_id,
            movie_id
        ) VALUES (
            favorite_content_seq.NEXTVAL,
            p_user_id,
            p_tv_show_id,
            p_movie_id
        );

    ELSE
        raise_application_error(-20001, 'Either tv_show_id or movie_id must be provided, but not both.');
    END IF;
EXCEPTION
    WHEN dup_val_on_index THEN
        raise_application_error(-20002, 'Duplicate combination of user, tv_show and movie not allowed.');
END;
/

CREATE OR REPLACE PROCEDURE insert_into_genre (
    p_genre_name IN genre.genre_name%TYPE
) IS
BEGIN
    INSERT INTO genre (
        id,
        genre_name
    ) VALUES (
        genre_seq.NEXTVAL,
        p_genre_name
    );

EXCEPTION
    WHEN dup_val_on_index THEN
        raise_application_error(-20001, 'Duplicate genre name is not allowed.');
END;
/

CREATE OR REPLACE PROCEDURE insert_into_movie (
    p_movie_title            IN movie.movie_title%TYPE,
    p_movie_desc             IN movie.movie_desc%TYPE,
    p_movie_release_yr       IN movie.movie_release_yr%TYPE,
    p_movie_explicit_content IN movie.movie_explicit_content%TYPE,
    p_production_co_id       IN movie.production_co_id%TYPE
) IS
BEGIN
    INSERT INTO movie (
        id,
        movie_title,
        movie_desc,
        movie_release_yr,
        movie_explicit_content,
        production_co_id
    ) VALUES (
        movie_seq.NEXTVAL,
        p_movie_title,
        p_movie_desc,
        p_movie_release_yr,
        p_movie_explicit_content,
        p_production_co_id
    );

EXCEPTION
    WHEN dup_val_on_index THEN
        raise_application_error(-20001, 'Duplicate movie title not allowed.');
END;
/

CREATE OR REPLACE PROCEDURE insert_into_tv_show (
    p_show_title            IN tv_show.show_title%TYPE,
    p_show_desc             IN tv_show.show_desc%TYPE,
    p_show_release_yr       IN tv_show.show_release_yr%TYPE,
    p_show_explicit_content IN tv_show.show_explicit_content%TYPE,
    p_season_count          IN tv_show.season_count%TYPE,
    p_production_co_id      IN tv_show.production_co_id%TYPE
) IS
BEGIN
    INSERT INTO tv_show (
        id,
        show_title,
        show_desc,
        show_release_yr,
        show_explicit_content,
        season_count,
        production_co_id
    ) VALUES (
        tv_show_seq.NEXTVAL,
        p_show_title,
        p_show_desc,
        p_show_release_yr,
        p_show_explicit_content,
        p_season_count,
        p_production_co_id
    );

EXCEPTION
    WHEN dup_val_on_index THEN
        raise_application_error(-20002, 'Duplicate TV show title not allowed.');
END;
/

CREATE OR REPLACE PROCEDURE insert_into_app_user (
    p_first_name IN app_user.first_name%TYPE,
    p_last_name  IN app_user.last_name%TYPE,
    p_username   IN app_user.username%TYPE,
    p_dob        IN app_user.dob%TYPE,
    p_email      IN app_user.email%TYPE
) IS
BEGIN
    INSERT INTO app_user (
        id,
        first_name,
        last_name,
        username,
        dob,
        email
    ) VALUES (
        app_user_seq.NEXTVAL,
        p_first_name,
        p_last_name,
        p_username,
        p_dob,
        p_email
    );

EXCEPTION
    WHEN dup_val_on_index THEN
        raise_application_error(-20001, 'Duplicate username or email not allowed.');
END;
/

CREATE OR REPLACE PROCEDURE insert_into_user_preference (
    p_user_id  IN user_preference.user_id%TYPE,
    p_genre_id IN user_preference.genre_id%TYPE
) IS
BEGIN
    INSERT INTO user_preference (
        id,
        user_id,
        genre_id
    ) VALUES (
        user_preference_seq.NEXTVAL,
        p_user_id,
        p_genre_id
    );

EXCEPTION
    WHEN dup_val_on_index THEN
        raise_application_error(-20001, 'Duplicate combination of user and preferences not allowed');
END;
/