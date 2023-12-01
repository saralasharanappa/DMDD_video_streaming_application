SET SERVEROUTPUT ON;

DECLARE
    ncount NUMBER;
BEGIN
    -- Check if PRODUCTION_COMPANY_USER exists
    SELECT COUNT(1)
    INTO ncount
    FROM dba_users
    WHERE username = 'PRODUCTION_COMPANY_USER';

    IF (ncount > 0) THEN
        -- Drop PRODUCTION_COMPANY_USER if it exists
        EXECUTE IMMEDIATE 'DROP USER PRODUCTION_COMPANY_USER CASCADE';
        dbms_output.put_line('PRODUCTION_COMPANY_USER DROPPED');
    ELSE
        dbms_output.put_line('PRODUCTION_COMPANY_USER DOES NOT EXIST');
    END IF;

        -- Check if APP_USER exists
    SELECT COUNT(1)
    INTO ncount
    FROM dba_users
    WHERE username = 'APP_USER';

    IF (ncount > 0) THEN
        -- Drop APP_USER if it exists
        EXECUTE IMMEDIATE 'DROP USER APP_USER CASCADE';
        dbms_output.put_line('APP_USER DROPPED');
    ELSE
        dbms_output.put_line('APP_USER DOES NOT EXIST');
    END IF;
    
        -- Check if APP_USER_UNDER_18 exists
    SELECT COUNT(1)
    INTO ncount
    FROM dba_users
    WHERE username = 'APP_USER_UNDER_18';

    IF (ncount > 0) THEN
        -- Drop APP_USER_UNDER_18 if it exists
        EXECUTE IMMEDIATE 'DROP USER APP_USER_UNDER_18 CASCADE';
        dbms_output.put_line('APP_USER_UNDER_18 DROPPED');
    ELSE
        dbms_output.put_line('APP_USER_UNDER_18 DOES NOT EXIST');
    END IF;
    

    -- Create PRODUCTION_COMPANY_ROLE
    EXECUTE IMMEDIATE 'CREATE USER PRODUCTION_COMPANY_USER';

    -- Grant CONNECT and CREATE SESSION privileges
    EXECUTE IMMEDIATE 'GRANT CREATE SESSION, CONNECT TO PRODUCTION_COMPANY_USER';

    -- Grant EXECUTE privilege on production_company_pkg procedures
    EXECUTE IMMEDIATE 'GRANT EXECUTE ON production_company_pkg TO PRODUCTION_COMPANY_USER';

    COMMIT;
    dbms_output.put_line('PRODUCTION_COMPANY_USER is created and granted privileges');

    -- Create APP_USER
    EXECUTE IMMEDIATE 'CREATE USER APP_USER';

    -- Grant CONNECT and CREATE SESSION privileges
    EXECUTE IMMEDIATE 'GRANT CREATE SESSION, CONNECT TO APP_USER';

    -- Grant EXECUTE privilege on app_user_pkg procedures
    EXECUTE IMMEDIATE 'GRANT EXECUTE ON app_user_pkg TO APP_USER';

    COMMIT;
    dbms_output.put_line('APP_USER is created and granted privileges');
    
        -- Create APP_USER_UNDER_18
    EXECUTE IMMEDIATE 'CREATE USER APP_USER_UNDER_18';

    -- Grant CONNECT and CREATE SESSION privileges
    EXECUTE IMMEDIATE 'GRANT CREATE SESSION, CONNECT TO APP_USER_UNDER_18';

    -- Grant EXECUTE privilege on app_user_pkg procedures
    EXECUTE IMMEDIATE 'GRANT EXECUTE ON app_user_pkg TO APP_USER_UNDER_18';

    COMMIT;
    dbms_output.put_line('APP_USER_UNDER_18 is created and granted privileges');
END;
/
