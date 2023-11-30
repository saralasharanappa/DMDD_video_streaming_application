set serveroutput on

DECLARE
    ncount NUMBER;
BEGIN
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
    -- Check if PRODUCTION_COMPANY_USER already exists
    SELECT COUNT(1)
    INTO ncount
    FROM dba_users
    WHERE username = 'PRODUCTION_COMPANY_USER';

    IF (ncount > 0) THEN
        dbms_output.put_line('PRODUCTION_COMPANY_USER ALREADY EXISTS');
    ELSE
        -- Create PRODUCTION_COMPANY_ROLE
        EXECUTE IMMEDIATE 'CREATE USER PRODUCTION_COMPANY_USER';

        -- Grant CONNECT and CREATE SESSION privileges
        EXECUTE IMMEDIATE 'GRANT CREATE SESSION, CONNECT TO PRODUCTION_COMPANY_USER';

         -- Grant EXECUTE privilege on insert_into_production_co procedure
        EXECUTE IMMEDIATE 'GRANT EXECUTE ON insert_into_production_co TO PRODUCTION_COMPANY_USER';

        COMMIT;
        dbms_output.put_line('PRODUCTION_COMPANY_ROLE is created and granted privileges');
    END IF;
END;