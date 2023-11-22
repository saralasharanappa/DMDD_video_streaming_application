set serveroutput on

DECLARE
    ncount NUMBER;
BEGIN
    -- Check if PRODUCTION_COMPANY_ROLE exists before attempting to drop
    SELECT
        COUNT(1)
    INTO ncount
    FROM
        dba_roles
    WHERE
        role = 'PRODUCTION_COMPANY_ROLE';

    IF ( ncount > 0 ) THEN
        -- Drop PRODUCTION_COMPANY_ROLE if it exists
        EXECUTE IMMEDIATE 'DROP ROLE PRODUCTION_COMPANY_ROLE';
        dbms_output.put_line('PRODUCTION_COMPANY_ROLE DROPPED');
    ELSE
        dbms_output.put_line('PRODUCTION_COMPANY_ROLE DOES NOT EXIST');
    END IF;

    -- Check if APP_USER_ROLE exists before attempting to drop
    SELECT
        COUNT(1)
    INTO ncount
    FROM
        dba_roles
    WHERE
        role = 'APP_USER_ROLE';

    IF ( ncount > 0 ) THEN
        -- Drop APP_USER_ROLE if it exists
        EXECUTE IMMEDIATE 'DROP ROLE APP_USER_ROLE';
        dbms_output.put_line('APP_USER_ROLE DROPPED');
    ELSE
        dbms_output.put_line('APP_USER_ROLE DOES NOT EXIST');
    END IF;

    -- Check if production_company_user exists before attempting to drop
    SELECT
        COUNT(1)
    INTO ncount
    FROM
        dba_users
    WHERE
        username = 'PRODUCTION_COMPANY_USER';

    IF ( ncount > 0 ) THEN
        -- Drop production_company_user if it exists
        EXECUTE IMMEDIATE 'DROP USER PRODUCTION_COMPANY_USER CASCADE';
        dbms_output.put_line('PRODUCTION_COMPANY_USER DROPPED');
    ELSE
        dbms_output.put_line('PRODUCTION_COMPANY_USER DOES NOT EXIST');
    END IF;

    -- Check if app_user exists before attempting to drop
    SELECT
        COUNT(1)
    INTO ncount
    FROM
        dba_users
    WHERE
        username = 'APP_USER';

    IF ( ncount > 0 ) THEN
        -- Drop app_user if it exists
        EXECUTE IMMEDIATE 'DROP USER APP_USER CASCADE';
        dbms_output.put_line('APP_USER DROPPED');
    ELSE
        dbms_output.put_line('APP_USER DOES NOT EXIST');
    END IF;

END;
/

DECLARE
    ncount NUMBER;
BEGIN
  -- Check if PRODUCTION_COMPANY_ROLE already exists
    SELECT
        COUNT(1)
    INTO ncount
    FROM
        dba_roles
    WHERE
        role = 'PRODUCTION_COMPANY_ROLE';

    IF ( ncount > 0 ) THEN
        dbms_output.put_line('PRODUCTION_COMPANY_ROLE ALREADY EXISTS');
    ELSE
    -- Create PRODUCTION_COMPANY_ROLE
        EXECUTE IMMEDIATE 'CREATE ROLE PRODUCTION_COMPANY_ROLE';
    
    -- Grant CONNECT and CREATE SESSION privileges
        EXECUTE IMMEDIATE 'GRANT CREATE SESSION, CONNECT TO PRODUCTION_COMPANY_ROLE';
    
    -- Grant SELECT, UPDATE, INSERT, DELETE on specific tables
        FOR x IN (
            SELECT
                *
            FROM
                user_tables
            WHERE
                table_name IN ( 'TV_SHOW', 'MOVIE' )
        ) LOOP
            EXECUTE IMMEDIATE 'GRANT SELECT, UPDATE, INSERT, DELETE ON '
                              || x.table_name
                              || ' TO PRODUCTION_COMPANY_ROLE';
        END LOOP;

    -- Grant SELECT on content-related views
        EXECUTE IMMEDIATE 'GRANT SELECT ON MOVIE_GENRES TO PRODUCTION_COMPANY_ROLE';
        EXECUTE IMMEDIATE 'GRANT SELECT ON TV_SHOW_EPISODES TO PRODUCTION_COMPANY_ROLE';
        EXECUTE IMMEDIATE 'GRANT SELECT ON PRODUCTION_COMPANY_MOVIES TO PRODUCTION_COMPANY_ROLE';
        EXECUTE IMMEDIATE 'GRANT SELECT ON PRODUCTION_COMPANY_TV_SHOWS TO PRODUCTION_COMPANY_ROLE';
        EXECUTE IMMEDIATE 'GRANT SELECT ON GENRE_MEDIA_VIEW TO PRODUCTION_COMPANY_ROLE';
        EXECUTE IMMEDIATE 'GRANT SELECT ON ALL_MEDIA TO PRODUCTION_COMPANY_ROLE';
        EXECUTE IMMEDIATE 'GRANT SELECT ON NON_EXPLICIT_CONTENT_VIEW TO PRODUCTION_COMPANY_ROLE';
        EXECUTE IMMEDIATE 'GRANT SELECT ON EXPLICIT_CONTENT_VIEW TO PRODUCTION_COMPANY_ROLE';
        COMMIT;
        dbms_output.put_line('PRODUCTION_COMPANY_ROLE is created and granted privileges');
    END IF;

END;
/

-- Create APP_USER_ROLE
DECLARE
    ncount NUMBER;
BEGIN
    -- Check if APP_USER_ROLE already exists
    SELECT
        COUNT(1)
    INTO ncount
    FROM
        dba_roles
    WHERE
        role = 'APP_USER_ROLE';

    IF ( ncount > 0 ) THEN
        dbms_output.put_line('APP_USER_ROLE ALREADY EXISTS');
    ELSE
        -- Create APP_USER_ROLE
        EXECUTE IMMEDIATE 'CREATE ROLE APP_USER_ROLE';
        
        -- Grant CONNECT and CREATE SESSION privileges
        EXECUTE IMMEDIATE 'GRANT CREATE SESSION, CONNECT TO APP_USER_ROLE';
        
        -- Grant SELECT, UPDATE, INSERT, DELETE on specific tables
        FOR x IN (
            SELECT
                *
            FROM
                user_tables
            WHERE
                table_name IN ( 'APP_USER', 'USER_PREFERENCES', 'FAVORITE_CONTENT' )
        ) LOOP
            EXECUTE IMMEDIATE 'GRANT SELECT, UPDATE, INSERT, DELETE ON '
                              || x.table_name
                              || ' TO APP_USER_ROLE';
        END LOOP;

        -- Grant SELECT on user-related views
        EXECUTE IMMEDIATE 'GRANT SELECT ON APP_USER_VIEW TO APP_USER_ROLE';
        EXECUTE IMMEDIATE 'GRANT SELECT ON USER_PREFERENCE_VIEW TO APP_USER_ROLE';
        EXECUTE IMMEDIATE 'GRANT SELECT ON USER_FAVORITE_CONTENT TO APP_USER_ROLE';
        EXECUTE IMMEDIATE 'GRANT SELECT ON ALL_MEDIA TO APP_USER_ROLE';
        COMMIT;
        dbms_output.put_line('APP_USER_ROLE is created and granted privileges');
    END IF;

END;
/