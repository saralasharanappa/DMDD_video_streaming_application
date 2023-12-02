ALTER SESSION SET current_schema=APP_ADMIN;
SET SERVEROUTPUT ON;

BEGIN
    insert_appuser_pkg.insert_into_app_user('John', 'Doe', TO_DATE('1990-01-15', 'yyyy-mm-dd'),
                                           'johndoe@email.com');

    insert_appuser_pkg.insert_into_app_user('Jane', 'Smith', TO_DATE('1985-05-20', 'yyyy-mm-dd'),
                                           'janesmith@email.com');

    insert_appuser_pkg.insert_into_app_user('Michael', 'Johnson', TO_DATE('1995-08-10', 'yyyy-mm-dd'),
                                           'michaelj@email.com');

    insert_appuser_pkg.insert_into_app_user('Emily', 'Brown', TO_DATE('1988-03-25', 'yyyy-mm-dd'),
                                           'emilyb@email.com');

    insert_appuser_pkg.insert_into_app_user('David', 'Wilson', TO_DATE('1992-11-02', 'yyyy-mm-dd'),
                                           'davidw@email.com');

    insert_appuser_pkg.insert_into_app_user('Sarah', 'Johnson', TO_DATE('1993-07-18', 'yyyy-mm-dd'),
                                           'sarahj@email.com');

    insert_appuser_pkg.insert_into_app_user('Robert', 'Miller', TO_DATE('1987-12-05', 'yyyy-mm-dd'),
                                           'robertm@email.com');

    insert_appuser_pkg.insert_into_app_user('Olivia', 'Lee', TO_DATE('1990-09-30', 'yyyy-mm-dd'),
                                           'olivial@email.com');

    insert_appuser_pkg.insert_into_app_user('Daniel', 'Anderson', TO_DATE('1994-04-12', 'yyyy-mm-dd'),
                                           'danield@email.com');

    insert_appuser_pkg.insert_into_app_user('Sophia', 'Martinez', TO_DATE('1986-02-28', 'yyyy-mm-dd'),
                                           'sophiam@email.com');

    insert_appuser_pkg.insert_into_app_user('Alice', 'Smith', TO_DATE('2008-11-15', 'yyyy-mm-dd'),
                                           'alice@email.com');

    insert_appuser_pkg.insert_into_app_user('Bob', 'Johnson', TO_DATE('2010-05-03', 'yyyy-mm-dd'),
                                           'bob@email.com');

    insert_appuser_pkg.insert_into_app_user('Charlie', 'Davis', TO_DATE('2005-08-20', 'yyyy-mm-dd'),
                                           'charlie@email.com');

EXCEPTION
    WHEN OTHERS THEN
        dbms_output.put_line('Error inserting into app_user: ' || sqlerrm);
END;
/

BEGIN
    insert_appuser_pkg.insert_into_user_preference(1, 2);
    insert_appuser_pkg.insert_into_user_preference(2, 1);
    insert_appuser_pkg.insert_into_user_preference(3, 3);
    insert_appuser_pkg.insert_into_user_preference(4, 4);
    insert_appuser_pkg.insert_into_user_preference(5, 5);
    insert_appuser_pkg.insert_into_user_preference(6, 6);
    insert_appuser_pkg.insert_into_user_preference(7, 7);
    insert_appuser_pkg.insert_into_user_preference(8, 8);
    insert_appuser_pkg.insert_into_user_preference(9, 9);
    insert_appuser_pkg.insert_into_user_preference(10, 10);
EXCEPTION
    WHEN OTHERS THEN
        dbms_output.put_line('Error inserting into user_preference: ' || sqlerrm);
END;
/

BEGIN
    insert_appuser_pkg.insert_into_favorite_content(1, 1, NULL);
    insert_appuser_pkg.insert_into_favorite_content(2, NULL, 2);
    insert_appuser_pkg.insert_into_favorite_content(3, 4, NULL);
    insert_appuser_pkg.insert_into_favorite_content(4, NULL, 5);
    insert_appuser_pkg.insert_into_favorite_content(5, NULL, 6);
    insert_appuser_pkg.insert_into_favorite_content(6, 8, NULL);
    insert_appuser_pkg.insert_into_favorite_content(7, NULL, 3);
    insert_appuser_pkg.insert_into_favorite_content(8, 2, NULL);
    insert_appuser_pkg.insert_into_favorite_content(9, NULL, 6);
    insert_appuser_pkg.insert_into_favorite_content(10, 10, NULL);
EXCEPTION
    WHEN OTHERS THEN
        dbms_output.put_line('Error inserting into favorite_content: ' || sqlerrm);
END;
/
