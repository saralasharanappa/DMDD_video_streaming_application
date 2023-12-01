CREATE OR REPLACE PACKAGE production_company_pkg AS
    PROCEDURE insert_into_production_co (
        p_company_name    IN production_co.company_name%TYPE,
        p_headquarters    IN production_co.headquarters%TYPE
    );

    PROCEDURE insert_into_tv_show (
        p_show_title            IN tv_show.show_title%TYPE,
        p_show_desc             IN tv_show.show_desc%TYPE,
        p_show_release_yr       IN tv_show.show_release_yr%TYPE,
        p_show_explicit_content IN tv_show.show_explicit_content%TYPE,
        p_season_count          IN tv_show.season_count%TYPE,
        p_production_co_id      IN tv_show.production_co_id%TYPE
    );

    PROCEDURE insert_into_episode (
        p_episode_title IN episode.episode_title%TYPE,
        p_episode_desc  IN episode.episode_desc%TYPE,
        p_season_no     IN episode.season_no%TYPE,
        p_episode_count IN episode.episode_count%TYPE,
        p_tv_show_id    IN episode.tv_show_id%TYPE
    );

    PROCEDURE insert_into_movie (
        p_movie_title            IN movie.movie_title%TYPE,
        p_movie_desc             IN movie.movie_desc%TYPE,
        p_movie_release_yr       IN movie.movie_release_yr%TYPE,
        p_movie_explicit_content IN movie.movie_explicit_content%TYPE,
        p_production_co_id       IN movie.production_co_id%TYPE
    );
END production_company_pkg;
/

CREATE OR REPLACE PACKAGE BODY production_company_pkg AS
    PROCEDURE insert_into_production_co (
        p_company_name    IN production_co.company_name%TYPE,
        p_headquarters    IN production_co.headquarters%TYPE
    ) IS
    BEGIN
        INSERT INTO production_co (
            company_name,
            headquarters
        ) VALUES (
            p_company_name,
            p_headquarters
        );

        COMMIT;
    EXCEPTION
        WHEN dup_val_on_index THEN
            raise_application_error(-20001, 'Duplicate combination of company name and headquarters not allowed.');
    END insert_into_production_co;

    PROCEDURE insert_into_tv_show (
        p_show_title            IN tv_show.show_title%TYPE,
        p_show_desc             IN tv_show.show_desc%TYPE,
        p_show_release_yr       IN tv_show.show_release_yr%TYPE,
        p_show_explicit_content IN tv_show.show_explicit_content%TYPE,
        p_season_count          IN tv_show.season_count%TYPE,
        p_production_co_id      IN tv_show.production_co_id%TYPE
    ) IS
    BEGIN
        INSERT INTO tv_show (
            show_title,
            show_desc,
            show_release_yr,
            show_explicit_content,
            season_count,
            production_co_id
        ) VALUES (
            p_show_title,
            p_show_desc,
            p_show_release_yr,
            p_show_explicit_content,
            p_season_count,
            p_production_co_id
        );

        COMMIT;
    EXCEPTION
        WHEN dup_val_on_index THEN
            raise_application_error(-20002, 'Duplicate TV show title not allowed.');
    END insert_into_tv_show;

    PROCEDURE insert_into_episode (
        p_episode_title IN episode.episode_title%TYPE,
        p_episode_desc  IN episode.episode_desc%TYPE,
        p_season_no     IN episode.season_no%TYPE,
        p_episode_count IN episode.episode_count%TYPE,
        p_tv_show_id    IN episode.tv_show_id%TYPE
    ) IS
    BEGIN
        INSERT INTO episode (
            episode_title,
            episode_desc,
            season_no,
            episode_count,
            tv_show_id
        ) VALUES (
            p_episode_title,
            p_episode_desc,
            p_season_no,
            p_episode_count,
            p_tv_show_id
        );

        COMMIT;
    EXCEPTION
        WHEN dup_val_on_index THEN
            raise_application_error(-20002, 'Duplicate episode title not allowed.');
    END insert_into_episode;

    PROCEDURE insert_into_movie (
        p_movie_title            IN movie.movie_title%TYPE,
        p_movie_desc             IN movie.movie_desc%TYPE,
        p_movie_release_yr       IN movie.movie_release_yr%TYPE,
        p_movie_explicit_content IN movie.movie_explicit_content%TYPE,
        p_production_co_id       IN movie.production_co_id%TYPE
    ) IS
    BEGIN
        INSERT INTO movie (
            movie_title,
            movie_desc,
            movie_release_yr,
            movie_explicit_content,
            production_co_id
        ) VALUES (
            p_movie_title,
            p_movie_desc,
            p_movie_release_yr,
            p_movie_explicit_content,
            p_production_co_id
        );

        COMMIT;
    EXCEPTION
        WHEN dup_val_on_index THEN
            raise_application_error(-20001, 'Duplicate movie title not allowed.');
    END insert_into_movie;
END production_company_pkg;
/

CREATE OR REPLACE PACKAGE app_user_pkg AS
    PROCEDURE insert_into_app_user (
        p_first_name IN app_user.first_name%TYPE,
        p_last_name  IN app_user.last_name%TYPE,
        p_username   IN app_user.username%TYPE,
        p_dob        IN app_user.dob%TYPE,
        p_email      IN app_user.email%TYPE
    );

    PROCEDURE insert_into_user_preference (
        p_user_id  IN user_preference.user_id%TYPE,
        p_genre_id IN user_preference.genre_id%TYPE
    );

    PROCEDURE insert_into_favorite_content (
        p_user_id    IN favorite_content.user_id%TYPE,
        p_tv_show_id IN favorite_content.tv_show_id%TYPE,
        p_movie_id   IN favorite_content.movie_id%TYPE
    );
END app_user_pkg;
/

CREATE OR REPLACE PACKAGE BODY app_user_pkg AS
    PROCEDURE insert_into_app_user (
        p_first_name IN app_user.first_name%TYPE,
        p_last_name  IN app_user.last_name%TYPE,
        p_username   IN app_user.username%TYPE,
        p_dob        IN app_user.dob%TYPE,
        p_email      IN app_user.email%TYPE
    ) IS
    BEGIN
        INSERT INTO app_user (
            first_name,
            last_name,
            username,
            dob,
            email
        ) VALUES (
            p_first_name,
            p_last_name,
            p_username,
            p_dob,
            p_email
        );

        COMMIT;
    EXCEPTION
        WHEN dup_val_on_index THEN
            raise_application_error(-20001, 'Duplicate username or email not allowed.');
    END insert_into_app_user;

    PROCEDURE insert_into_user_preference (
        p_user_id  IN user_preference.user_id%TYPE,
        p_genre_id IN user_preference.genre_id%TYPE
    ) IS
    BEGIN
        INSERT INTO user_preference (
            user_id,
            genre_id
        ) VALUES (
            p_user_id,
            p_genre_id
        );

        COMMIT;
    EXCEPTION
        WHEN dup_val_on_index THEN
            raise_application_error(-20001, 'Duplicate combination of user and preferences not allowed');
    END insert_into_user_preference;

    PROCEDURE insert_into_favorite_content (
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
                user_id,
                tv_show_id,
                movie_id
            ) VALUES (
                p_user_id,
                p_tv_show_id,
                p_movie_id
            );

        ELSE
            raise_application_error(-20001, 'Either tv_show_id or movie_id must be provided, but not both.');
        END IF;

        COMMIT;
    EXCEPTION
        WHEN dup_val_on_index THEN
            raise_application_error(-20002, 'Duplicate combination of user, tv_show, and movie not allowed.');
    END insert_into_favorite_content;
END app_user_pkg;
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
    
    COMMIT;
EXCEPTION
    WHEN dup_val_on_index THEN
        raise_application_error(-20002, 'Duplicate combination of genre, tv_show and movie not allowed.');
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

    COMMIT;
EXCEPTION
    WHEN dup_val_on_index THEN
        raise_application_error(-20001, 'Duplicate genre name is not allowed.');
END;
/

--------------------UPDATE PROCEDURES--------------------------

CREATE OR REPLACE PROCEDURE update_tv_show (
    p_id                    IN tv_show.id%TYPE,
    p_show_title            IN tv_show.show_title%TYPE DEFAULT NULL,
    p_show_desc             IN tv_show.show_desc%TYPE DEFAULT NULL,
    p_show_release_yr       IN tv_show.show_release_yr%TYPE DEFAULT NULL,
    p_show_explicit_content IN tv_show.show_explicit_content%TYPE DEFAULT NULL,
    p_season_count          IN tv_show.season_count%TYPE DEFAULT NULL,
    p_production_co_id      IN tv_show.production_co_id%TYPE DEFAULT NULL
) IS
    v_count INT;
BEGIN
    -- Check for unique show_title constraint
    IF p_show_title IS NOT NULL THEN
        SELECT COUNT(*)
        INTO v_count
        FROM tv_show
        WHERE show_title = p_show_title
          AND id != p_id;

        IF v_count > 0 THEN
            raise_application_error(-20005, 'Another TV show with the same title already exists.');
        END IF;
    END IF;

    UPDATE tv_show SET
        show_title = COALESCE(p_show_title, show_title),
        show_desc = COALESCE(p_show_desc, show_desc),
        show_release_yr = COALESCE(p_show_release_yr, show_release_yr),
        show_explicit_content = COALESCE(p_show_explicit_content, show_explicit_content),
        season_count = COALESCE(p_season_count, season_count),
        production_co_id = COALESCE(p_production_co_id, production_co_id)
    WHERE id = p_id;

    COMMIT;
EXCEPTION
    WHEN NO_DATA_FOUND THEN
        raise_application_error(-20003, 'TV Show not found with the provided ID.');
    WHEN OTHERS THEN
        raise_application_error(-20004, 'An error occurred during the update process.');
END update_tv_show;
/

CREATE OR REPLACE PROCEDURE update_episode (
    p_id            IN episode.id%TYPE,
    p_episode_title IN episode.episode_title%TYPE DEFAULT NULL,
    p_episode_desc  IN episode.episode_desc%TYPE DEFAULT NULL,
    p_season_no     IN episode.season_no%TYPE DEFAULT NULL,
    p_episode_count IN episode.episode_count%TYPE DEFAULT NULL,
    p_tv_show_id    IN episode.tv_show_id%TYPE DEFAULT NULL
) IS
    v_count INT;
BEGIN
    -- Check for unique episode_title constraint
    IF p_episode_title IS NOT NULL THEN
        SELECT COUNT(*)
        INTO v_count
        FROM episode
        WHERE episode_title = p_episode_title
          AND id != p_id;

        IF v_count > 0 THEN
            raise_application_error(-20005, 'Another episode with the same title already exists.');
        END IF;
    END IF;

    UPDATE episode SET
        episode_title = COALESCE(p_episode_title, episode_title),
        episode_desc = COALESCE(p_episode_desc, episode_desc),
        season_no = COALESCE(p_season_no, season_no),
        episode_count = COALESCE(p_episode_count, episode_count),
        tv_show_id = COALESCE(p_tv_show_id, tv_show_id)
    WHERE id = p_id;

    COMMIT;
EXCEPTION
    WHEN NO_DATA_FOUND THEN
        raise_application_error(-20003, 'Episode not found with the provided ID.');
    WHEN OTHERS THEN
        raise_application_error(-20004, 'An error occurred during the update process.');
END update_episode;
/

CREATE OR REPLACE PROCEDURE update_movie (
    p_id                     IN movie.id%TYPE,
    p_movie_title            IN movie.movie_title%TYPE DEFAULT NULL,
    p_movie_desc             IN movie.movie_desc%TYPE DEFAULT NULL,
    p_movie_release_yr       IN movie.movie_release_yr%TYPE DEFAULT NULL,
    p_movie_explicit_content IN movie.movie_explicit_content%TYPE DEFAULT NULL,
    p_production_co_id       IN movie.production_co_id%TYPE DEFAULT NULL
) IS
    v_count INT;
BEGIN
    -- Check for unique movie_title constraint
    IF p_movie_title IS NOT NULL THEN
        SELECT COUNT(*)
        INTO v_count
        FROM movie
        WHERE movie_title = p_movie_title
          AND id != p_id;

        IF v_count > 0 THEN
            raise_application_error(-20005, 'Another movie with the same title already exists.');
        END IF;
    END IF;

    UPDATE movie SET
        movie_title = COALESCE(p_movie_title, movie_title),
        movie_desc = COALESCE(p_movie_desc, movie_desc),
        movie_release_yr = COALESCE(p_movie_release_yr, movie_release_yr),
        movie_explicit_content = COALESCE(p_movie_explicit_content, movie_explicit_content),
        production_co_id = COALESCE(p_production_co_id, production_co_id)
    WHERE id = p_id;

    COMMIT;
EXCEPTION
    WHEN NO_DATA_FOUND THEN
        raise_application_error(-20003, 'Movie not found with the provided ID.');
    WHEN OTHERS THEN
        raise_application_error(-20004, 'An error occurred during the update process.');
END update_movie;
/

CREATE OR REPLACE PROCEDURE update_production_co (
    p_id           IN production_co.id%TYPE,
    p_company_name IN production_co.company_name%TYPE DEFAULT NULL,
    p_headquarters IN production_co.headquarters%TYPE DEFAULT NULL
) IS
    v_count INT;
BEGIN
    -- Check for unique company_name and headquarters constraint
    IF p_company_name IS NOT NULL OR p_headquarters IS NOT NULL THEN
        SELECT COUNT(*)
        INTO v_count
        FROM production_co
        WHERE (company_name = p_company_name OR p_company_name IS NULL)
          AND (headquarters = p_headquarters OR p_headquarters IS NULL)
          AND id != p_id;

        IF v_count > 0 THEN
            raise_application_error(-20005, 'Another production company with the same name and headquarters already exists.');
        END IF;
    END IF;

    UPDATE production_co SET
        company_name = COALESCE(p_company_name, company_name),
        headquarters = COALESCE(p_headquarters, headquarters)
    WHERE id = p_id;

    COMMIT;
EXCEPTION
    WHEN NO_DATA_FOUND THEN
        raise_application_error(-20003, 'Production company not found with the provided ID.');
    WHEN OTHERS THEN
        raise_application_error(-20004, 'An error occurred during the update process.');
END update_production_co;
/

CREATE OR REPLACE PROCEDURE update_content_genre (
    p_id         IN content_genre.id%TYPE,
    p_genre_id   IN content_genre.genre_id%TYPE DEFAULT NULL,
    p_tv_show_id IN content_genre.tv_show_id%TYPE DEFAULT NULL,
    p_movie_id   IN content_genre.movie_id%TYPE DEFAULT NULL
) IS
    v_count INT;
BEGIN
    -- Check to ensure that either tv_show_id or movie_id is provided, but not both
    IF (p_tv_show_id IS NOT NULL AND p_movie_id IS NOT NULL) OR (p_tv_show_id IS NULL AND p_movie_id IS NULL) THEN
        raise_application_error(-20006, 'Either tv_show_id or movie_id must be provided, but not both.');
    END IF;

    -- Check for unique genre_id, tv_show_id, and movie_id combination constraint
    SELECT COUNT(*)
    INTO v_count
    FROM content_genre
    WHERE genre_id = p_genre_id
      AND NVL(tv_show_id, -1) = NVL(p_tv_show_id, -1)
      AND NVL(movie_id, -1) = NVL(p_movie_id, -1)
      AND id != p_id;

    IF v_count > 0 THEN
        raise_application_error(-20007, 'Another entry with the same genre, TV show, and movie combination already exists.');
    END IF;

    UPDATE content_genre SET
        genre_id = COALESCE(p_genre_id, genre_id),
        tv_show_id = p_tv_show_id,
        movie_id = p_movie_id
    WHERE id = p_id;

    COMMIT;
EXCEPTION
    WHEN NO_DATA_FOUND THEN
        raise_application_error(-20003, 'Content genre entry not found with the provided ID.');
    WHEN OTHERS THEN
        raise_application_error(-20004, 'An error occurred during the update process.');
END update_content_genre;
/

CREATE OR REPLACE PROCEDURE update_favorite_content (
    p_id         IN favorite_content.id%TYPE,
    p_user_id    IN favorite_content.user_id%TYPE DEFAULT NULL,
    p_tv_show_id IN favorite_content.tv_show_id%TYPE DEFAULT NULL,
    p_movie_id   IN favorite_content.movie_id%TYPE DEFAULT NULL
) IS
    v_count INT;
BEGIN
    -- Check to ensure that either tv_show_id or movie_id is provided, but not both
    IF (p_tv_show_id IS NOT NULL AND p_movie_id IS NOT NULL) OR (p_tv_show_id IS NULL AND p_movie_id IS NULL) THEN
        raise_application_error(-20006, 'Either tv_show_id or movie_id must be provided, but not both.');
    END IF;

    -- Check for unique user_id, tv_show_id, and movie_id combination constraint
    SELECT COUNT(*)
    INTO v_count
    FROM favorite_content
    WHERE user_id = p_user_id
      AND NVL(tv_show_id, -1) = NVL(p_tv_show_id, -1)
      AND NVL(movie_id, -1) = NVL(p_movie_id, -1)
      AND id != p_id;

    IF v_count > 0 THEN
        raise_application_error(-20007, 'Another entry with the same user, TV show, and movie combination already exists.');
    END IF;

    UPDATE favorite_content SET
        user_id = COALESCE(p_user_id, user_id),
        tv_show_id = p_tv_show_id,
        movie_id = p_movie_id
    WHERE id = p_id;

    COMMIT;
EXCEPTION
    WHEN NO_DATA_FOUND THEN
        raise_application_error(-20003, 'Favorite content entry not found with the provided ID.');
    WHEN OTHERS THEN
        raise_application_error(-20004, 'An error occurred during the update process.');
END update_favorite_content;
/

CREATE OR REPLACE PROCEDURE update_genre (
    p_id         IN genre.id%TYPE,
    p_genre_name IN genre.genre_name%TYPE DEFAULT NULL
) IS
    v_count INT;
BEGIN
    -- Check for unique genre_name constraint
    IF p_genre_name IS NOT NULL THEN
        SELECT COUNT(*)
        INTO v_count
        FROM genre
        WHERE genre_name = p_genre_name
          AND id != p_id;

        IF v_count > 0 THEN
            raise_application_error(-20005, 'Another genre with the same name already exists.');
        END IF;
    END IF;

    UPDATE genre SET
        genre_name = COALESCE(p_genre_name, genre_name)
    WHERE id = p_id;

    COMMIT;
EXCEPTION
    WHEN NO_DATA_FOUND THEN
        raise_application_error(-20003, 'Genre not found with the provided ID.');
    WHEN OTHERS THEN
        raise_application_error(-20004, 'An error occurred during the update process.');
END update_genre;
/

CREATE OR REPLACE PROCEDURE update_app_user (
    p_id         IN app_user.id%TYPE,
    p_first_name IN app_user.first_name%TYPE DEFAULT NULL,
    p_last_name  IN app_user.last_name%TYPE DEFAULT NULL,
    p_username   IN app_user.username%TYPE DEFAULT NULL,
    p_dob        IN app_user.dob%TYPE DEFAULT NULL,
    p_email      IN app_user.email%TYPE DEFAULT NULL
) IS
    v_count INT;
BEGIN
    -- Check for unique username constraint
    IF p_username IS NOT NULL THEN
        SELECT COUNT(*)
        INTO v_count
        FROM app_user
        WHERE username = p_username
          AND id != p_id;

        IF v_count > 0 THEN
            raise_application_error(-20005, 'Another user with the same username already exists.');
        END IF;
    END IF;

    -- Check for unique email constraint
    IF p_email IS NOT NULL THEN
        SELECT COUNT(*)
        INTO v_count
        FROM app_user
        WHERE email = p_email
          AND id != p_id;

        IF v_count > 0 THEN
            raise_application_error(-20006, 'Another user with the same email already exists.');
        END IF;
    END IF;

    UPDATE app_user SET
        first_name = COALESCE(p_first_name, first_name),
        last_name = COALESCE(p_last_name, last_name),
        username = COALESCE(p_username, username),
        dob = COALESCE(p_dob, dob),
        email = COALESCE(p_email, email)
    WHERE id = p_id;

    COMMIT;
EXCEPTION
    WHEN NO_DATA_FOUND THEN
        raise_application_error(-20003, 'App user not found with the provided ID.');
    WHEN OTHERS THEN
        raise_application_error(-20004, 'An error occurred during the update process.');
END update_app_user;
/

CREATE OR REPLACE PROCEDURE update_user_preference (
    p_id       IN user_preference.id%TYPE,
    p_user_id  IN user_preference.user_id%TYPE DEFAULT NULL,
    p_genre_id IN user_preference.genre_id%TYPE DEFAULT NULL
) IS
    v_count INT;
BEGIN
    -- Check for unique user_id and genre_id constraint
    IF p_user_id IS NOT NULL AND p_genre_id IS NOT NULL THEN
        SELECT COUNT(*)
        INTO v_count
        FROM user_preference
        WHERE user_id = p_user_id
          AND genre_id = p_genre_id
          AND id != p_id;

        IF v_count > 0 THEN
            raise_application_error(-20005, 'Another user preference with the same user and genre combination already exists.');
        END IF;
    END IF;

    UPDATE user_preference SET
        user_id = COALESCE(p_user_id, user_id),
        genre_id = COALESCE(p_genre_id, genre_id)
    WHERE id = p_id;

    COMMIT;
EXCEPTION
    WHEN NO_DATA_FOUND THEN
        raise_application_error(-20003, 'User preference not found with the provided ID.');
    WHEN OTHERS THEN
        raise_application_error(-20004, 'An error occurred during the update process.');
END update_user_preference;
/

-------------------DELETE PROCEDURES--------------------

CREATE OR REPLACE PROCEDURE delete_content_genre (
    p_id IN content_genre.id%TYPE
) IS
BEGIN
    DELETE FROM content_genre
    WHERE id = p_id;

    COMMIT;
EXCEPTION
    WHEN NO_DATA_FOUND THEN
        raise_application_error(-20003, 'Content genre entry not found with the provided ID.');
    WHEN OTHERS THEN
        raise_application_error(-20004, 'An error occurred during the deletion process.');
END delete_content_genre;
/

CREATE OR REPLACE PROCEDURE delete_episode (
    p_id IN episode.id%TYPE
) IS
BEGIN
    DELETE FROM episode
    WHERE id = p_id;

    COMMIT;
EXCEPTION
    WHEN NO_DATA_FOUND THEN
        raise_application_error(-20003, 'Episode not found with the provided ID.');
    WHEN OTHERS THEN
        raise_application_error(-20004, 'An error occurred during the deletion process.');
END delete_episode;
/

CREATE OR REPLACE PROCEDURE delete_favorite_content (
    p_id IN favorite_content.id%TYPE
) IS
BEGIN
    DELETE FROM favorite_content
    WHERE id = p_id;

    COMMIT;
EXCEPTION
    WHEN NO_DATA_FOUND THEN
        raise_application_error(-20003, 'Favorite content entry not found with the provided ID.');
    WHEN OTHERS THEN
        raise_application_error(-20004, 'An error occurred during the deletion process.');
END delete_favorite_content;
/

CREATE OR REPLACE PROCEDURE delete_genre (
    p_id IN genre.id%TYPE
) IS
BEGIN
    DELETE FROM genre
    WHERE id = p_id;

    COMMIT;
EXCEPTION
    WHEN NO_DATA_FOUND THEN
        raise_application_error(-20003, 'Genre not found with the provided ID.');
    WHEN OTHERS THEN
        raise_application_error(-20004, 'An error occurred during the deletion process.');
END delete_genre;
/

CREATE OR REPLACE PROCEDURE delete_movie (
    p_id IN movie.id%TYPE
) IS
BEGIN
    DELETE FROM movie
    WHERE id = p_id;

    COMMIT;
EXCEPTION
    WHEN NO_DATA_FOUND THEN
        raise_application_error(-20003, 'Movie not found with the provided ID.');
    WHEN OTHERS THEN
        raise_application_error(-20004, 'An error occurred during the deletion process.');
END delete_movie;
/

CREATE OR REPLACE PROCEDURE delete_production_co (
    p_id IN production_co.id%TYPE
) IS
BEGIN
    DELETE FROM production_co
    WHERE id = p_id;

    COMMIT;
EXCEPTION
    WHEN NO_DATA_FOUND THEN
        raise_application_error(-20003, 'Production company not found with the provided ID.');
    WHEN OTHERS THEN
        raise_application_error(-20004, 'An error occurred during the deletion process.');
END delete_production_co;
/

CREATE OR REPLACE PROCEDURE delete_tv_show (
    p_id IN tv_show.id%TYPE
) IS
BEGIN
    DELETE FROM tv_show
    WHERE id = p_id;

    COMMIT;
EXCEPTION
    WHEN NO_DATA_FOUND THEN
        raise_application_error(-20003, 'TV show not found with the provided ID.');
    WHEN OTHERS THEN
        raise_application_error(-20004, 'An error occurred during the deletion process.');
END delete_tv_show;
/

CREATE OR REPLACE PROCEDURE delete_app_user (
    p_id IN app_user.id%TYPE
) IS
BEGIN
    DELETE FROM app_user
    WHERE id = p_id;

    COMMIT;
EXCEPTION
    WHEN NO_DATA_FOUND THEN
        raise_application_error(-20003, 'App user not found with the provided ID.');
    WHEN OTHERS THEN
        raise_application_error(-20004, 'An error occurred during the deletion process.');
END delete_app_user;
/

CREATE OR REPLACE PROCEDURE delete_user_preference (
    p_id IN user_preference.id%TYPE
) IS
BEGIN
    DELETE FROM user_preference
    WHERE id = p_id;

    COMMIT;
EXCEPTION
    WHEN NO_DATA_FOUND THEN
        raise_application_error(-20003, 'User preference not found with the provided ID.');
    WHEN OTHERS THEN
        raise_application_error(-20004, 'An error occurred during the deletion process.');
END delete_user_preference;
/
