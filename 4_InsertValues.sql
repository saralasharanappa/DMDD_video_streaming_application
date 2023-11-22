SET SERVEROUTPUT ON;

BEGIN
    insert_into_production_co('Company A', 'Headquarters A');
    insert_into_production_co('Company B', 'Headquarters B');
    insert_into_production_co('Company C', 'Headquarters C');
    insert_into_production_co('Company D', 'Headquarters D');
    insert_into_production_co('Company E', 'Headquarters E');
    insert_into_production_co('Company F', 'Headquarters F');
    insert_into_production_co('Company G', 'Headquarters G');
    insert_into_production_co('Company H', 'Headquarters H');
    insert_into_production_co('Company I', 'Headquarters I');
    insert_into_production_co('Company J', 'Headquarters J');
EXCEPTION
    WHEN OTHERS THEN
        dbms_output.put_line('Error inserting into production_co: ' || sqlerrm);
END;
/
COMMIT;

SELECT
    *
FROM
    production_co;

BEGIN
    insert_into_tv_show('TV Show A', 'Description of TV Show A', 2020, 'N', 5,
                       1);
    insert_into_tv_show('TV Show B', 'Description of TV Show B', 2018, 'Y', 6,
                       2);
    insert_into_tv_show('TV Show C', 'Description of TV Show C', 2019, 'N', 4,
                       4);
    insert_into_tv_show('TV Show D', 'Description of TV Show D', 2021, 'Y', 7,
                       10);
    insert_into_tv_show('TV Show E', 'Description of TV Show E', 2022, 'N', 5,
                       3);
    insert_into_tv_show('TV Show F', 'Description of TV Show F', 2023, 'Y', 8,
                       5);
    insert_into_tv_show('TV Show G', 'Description of TV Show G', 2020, 'N', 6,
                       7);
    insert_into_tv_show('TV Show H', 'Description of TV Show H', 2019, 'Y', 5,
                       6);
    insert_into_tv_show('TV Show I', 'Description of TV Show I', 2022, 'N', 7,
                       9);
    insert_into_tv_show('TV Show J', 'Description of TV Show J', 2021, 'Y', 6,
                       8);
EXCEPTION
    WHEN OTHERS THEN
        dbms_output.put_line('Error inserting into tv_show: ' || sqlerrm);
END;
/
COMMIT;

SELECT
    *
FROM
    tv_show;

BEGIN
    insert_into_episode('Pilot Episode A', 'The first episode of TV Show A', 1, 1, 1);
    insert_into_episode('Second Episode A', 'Continuation of the story for TV Show A', 1, 2, 1);
    insert_into_episode('Third Episode A', 'Another exciting episode of TV Show A', 1, 3, 1);
    insert_into_episode('Pilot Episode B', 'The first episode of TV Show B', 1, 1, 2);
    insert_into_episode('Second Episode B', 'Continuation of the story for TV Show B', 1, 2, 2);
    insert_into_episode('Third Episode B', 'Another exciting episode of TV Show B', 1, 3, 2);
    insert_into_episode('Pilot Episode C', 'The first episode of TV Show C', 1, 1, 3);
    insert_into_episode('Second Episode C', 'Continuation of the story for TV Show C', 1, 2, 3);
    insert_into_episode('Third Episode C', 'Another exciting episode of TV Show C', 1, 3, 3);
    insert_into_episode('Pilot Episode D', 'The first episode of TV Show D', 1, 1, 4);
    insert_into_episode('Second Episode D', 'Continuation of the story for TV Show D', 1, 2, 4);
    insert_into_episode('Third Episode D', 'Another exciting episode of TV Show D', 1, 3, 4);
    insert_into_episode('Pilot Episode E', 'The first episode of TV Show E', 1, 1, 5);
    insert_into_episode('Second Episode E', 'Continuation of the story for TV Show E', 1, 2, 5);
    insert_into_episode('Third Episode E', 'Another exciting episode of TV Show E', 1, 3, 5);
    insert_into_episode('Pilot Episode F', 'The first episode of TV Show F', 1, 1, 6);
    insert_into_episode('Second Episode F', 'Continuation of the story for TV Show F', 1, 2, 6);
    insert_into_episode('Third Episode F', 'Another exciting episode of TV Show F', 1, 3, 6);
    insert_into_episode('Pilot Episode G', 'The first episode of TV Show G', 1, 1, 7);
    insert_into_episode('Second Episode G', 'Continuation of the story for TV Show G', 1, 2, 7);
EXCEPTION
    WHEN OTHERS THEN
        dbms_output.put_line('Error inserting into episode: ' || sqlerrm);
END;
/
COMMIT;

SELECT
    *
FROM
    episode;
/

BEGIN
    insert_into_genre('Drama');
    insert_into_genre('Comedy');
    insert_into_genre('Action');
    insert_into_genre('Horror');
    insert_into_genre('Sci-Fi');
    insert_into_genre('Fantasy');
    insert_into_genre('Romance');
    insert_into_genre('Thriller');
    insert_into_genre('Documentary');
    insert_into_genre('Animation');
EXCEPTION
    WHEN OTHERS THEN
        dbms_output.put_line('Error inserting into genre: ' || sqlerrm);
END;
/
COMMIT;

SELECT
    *
FROM
    genre;
/

BEGIN
    insert_into_movie('Movie A', 'Description of Movie A', 2020, 'N', 1);
    insert_into_movie('Movie B', 'Description of Movie B', 2018, 'Y', 2);
    insert_into_movie('Movie C', 'Description of Movie C', 2019, 'N', 4);
    insert_into_movie('Movie D', 'Description of Movie D', 2021, 'Y', 10);
    insert_into_movie('Movie E', 'Description of Movie E', 2022, 'N', 3);
    insert_into_movie('Movie F', 'Description of Movie F', 2023, 'Y', 5);
    insert_into_movie('Movie G', 'Description of Movie G', 2022, 'N', 7);
    insert_into_movie('Movie H', 'Description of Movie H', 2021, 'Y', 6);
    insert_into_movie('Movie I', 'Description of Movie I', 2019, 'N', 9);
    insert_into_movie('Movie J', 'Description of Movie J', 2020, 'Y', 8);
EXCEPTION
    WHEN OTHERS THEN
        dbms_output.put_line('Error inserting into movie: ' || sqlerrm);
END;
/
COMMIT;

SELECT
    *
FROM
    movie;
/

BEGIN
    insert_into_content_genre(1, 1, NULL); -- TV Show A
    insert_into_content_genre(2, 2, NULL); -- TV Show B
    insert_into_content_genre(3, 3, NULL); -- TV Show C
    insert_into_content_genre(4, 4, NULL); -- TV Show D
    insert_into_content_genre(5, 5, NULL); -- TV Show E
    insert_into_content_genre(6, 6, NULL); -- TV Show F
    insert_into_content_genre(7, 7, NULL); -- TV Show G
    insert_into_content_genre(8, 8, NULL); -- TV Show H
    insert_into_content_genre(9, 9, NULL); -- TV Show I
    insert_into_content_genre(10, 10, NULL); -- TV Show J

        -- Adding movies to content_genre
    insert_into_content_genre(1, NULL, 1); -- Movie A
    insert_into_content_genre(3, NULL, 2); -- Movie B
    insert_into_content_genre(4, NULL, 3); -- Movie C
    insert_into_content_genre(5, NULL, 4); -- Movie D
    insert_into_content_genre(6, NULL, 5); -- Movie E
EXCEPTION
    WHEN OTHERS THEN
        dbms_output.put_line('Error inserting into content_genre: ' || sqlerrm);
END;
/
COMMIT;

SELECT
    *
FROM
    content_genre;
/

BEGIN
    insert_into_app_user('John', 'Doe', 'johndoe', TO_DATE('1990-01-15', 'yyyy-mm-dd'),
                        'johndoe@email.com');
    insert_into_app_user('Jane', 'Smith', 'janesmith', TO_DATE('1985-05-20', 'yyyy-mm-dd'),
                        'janesmith@email.com');
    insert_into_app_user('Michael', 'Johnson', 'michaelj', TO_DATE('1995-08-10', 'yyyy-mm-dd'),
                        'michaelj@email.com');
    insert_into_app_user('Emily', 'Brown', 'emilyb', TO_DATE('1988-03-25', 'yyyy-mm-dd'),
                        'emilyb@email.com');
    insert_into_app_user('David', 'Wilson', 'davidw', TO_DATE('1992-11-02', 'yyyy-mm-dd'),
                        'davidw@email.com');
    insert_into_app_user('Sarah', 'Johnson', 'sarahj', TO_DATE('1993-07-18', 'yyyy-mm-dd'),
                        'sarahj@email.com');
    insert_into_app_user('Robert', 'Miller', 'robertm', TO_DATE('1987-12-05', 'yyyy-mm-dd'),
                        'robertm@email.com');
    insert_into_app_user('Olivia', 'Lee', 'olivial', TO_DATE('1990-09-30', 'yyyy-mm-dd'),
                        'olivial@email.com');
    insert_into_app_user('Daniel', 'Anderson', 'danield', TO_DATE('1994-04-12', 'yyyy-mm-dd'),
                        'danield@email.com');
    insert_into_app_user('Sophia', 'Martinez', 'sophiam', TO_DATE('1986-02-28', 'yyyy-mm-dd'),
                        'sophiam@email.com');
    insert_into_app_user('Alice', 'Smith', 'alice', TO_DATE('2008-11-15', 'yyyy-mm-dd'),
                        'alice@email.com');
    insert_into_app_user('Bob', 'Johnson', 'bob', TO_DATE('2010-05-03', 'yyyy-mm-dd'),
                        'bob@email.com');
    insert_into_app_user('Charlie', 'Davis', 'charlie', TO_DATE('2005-08-20', 'yyyy-mm-dd'),
                        'charlie@email.com');
EXCEPTION
    WHEN OTHERS THEN
        dbms_output.put_line('Error inserting into app_user: ' || sqlerrm);
END;
/
COMMIT;

SELECT
    *
FROM
    app_user;
/

BEGIN
    insert_into_user_preference(1, 2);
    insert_into_user_preference(2, 1);
    insert_into_user_preference(3, 3);
    insert_into_user_preference(4, 4);
    insert_into_user_preference(5, 5);
    insert_into_user_preference(6, 6);
    insert_into_user_preference(7, 7);
    insert_into_user_preference(8, 8);
    insert_into_user_preference(9, 9);
    insert_into_user_preference(10, 10);
EXCEPTION
    WHEN OTHERS THEN
        dbms_output.put_line('Error inserting into user_preference: ' || sqlerrm);
END;
/
COMMIT;

SELECT
    *
FROM
    user_preference;

BEGIN
    insert_into_favorite_content(1, 1, NULL);
    insert_into_favorite_content(2, NULL, 2);
    insert_into_favorite_content(3, 4, NULL);
    insert_into_favorite_content(4, NULL, 5);
    insert_into_favorite_content(5, NULL, 6);
    insert_into_favorite_content(6, 8, NULL);
    insert_into_favorite_content(7, NULL, 3);
    insert_into_favorite_content(8, 2, NULL);
    insert_into_favorite_content(9, NULL, 6);
    insert_into_favorite_content(10, 10, NULL);
EXCEPTION
    WHEN OTHERS THEN
        dbms_output.put_line('Error inserting into favorite_content: ' || sqlerrm);
END;
/
COMMIT;

SELECT
    *
FROM
    favorite_content;

SELECT
    dob
FROM
    app_user;

SELECT
    show_explicit_content
FROM
    tv_show
WHERE
    id = 8;