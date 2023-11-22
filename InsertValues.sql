SET SERVEROUTPUT ON;

BEGIN
    insert_into_production_co(1, 'Company A', 'Headquarters A');
    insert_into_production_co(2, 'Company B', 'Headquarters B');
    insert_into_production_co(3, 'Company C', 'Headquarters C');
    insert_into_production_co(4, 'Company D', 'Headquarters D');
    insert_into_production_co(5, 'Company E', 'Headquarters E');
    insert_into_production_co(6, 'Company F', 'Headquarters F');
    insert_into_production_co(7, 'Company G', 'Headquarters G');
    insert_into_production_co(8, 'Company H', 'Headquarters H');
    insert_into_production_co(9, 'Company I', 'Headquarters I');
    insert_into_production_co(10, 'Company J', 'Headquarters J');
END;
/

SELECT
    *
FROM
    production_co;

BEGIN
    insert_into_tv_show(1, 'TV Show A', 'Description of TV Show A', 2020, 'N',
                       5, 1);
    insert_into_tv_show(2, 'TV Show B', 'Description of TV Show B', 2018, 'Y',
                       6, 2);
    insert_into_tv_show(3, 'TV Show C', 'Description of TV Show C', 2019, 'N',
                       4, 4);
    insert_into_tv_show(4, 'TV Show D', 'Description of TV Show D', 2021, 'Y',
                       7, 10);
    insert_into_tv_show(5, 'TV Show E', 'Description of TV Show E', 2022, 'N',
                       5, 3);
    insert_into_tv_show(6, 'TV Show F', 'Description of TV Show F', 2023, 'Y',
                       8, 5);
    insert_into_tv_show(7, 'TV Show G', 'Description of TV Show G', 2020, 'N',
                       6, 7);
    insert_into_tv_show(8, 'TV Show H', 'Description of TV Show H', 2019, 'Y',
                       5, 6);
    insert_into_tv_show(9, 'TV Show I', 'Description of TV Show I', 2022, 'N',
                       7, 9);
    insert_into_tv_show(10, 'TV Show J', 'Description of TV Show J', 2021, 'Y',
                       6, 8);
END;
/

SELECT
    *
FROM
    tv_show;

BEGIN
    insert_into_episode(1, 'Pilot Episode A', 'The first episode of TV Show A', 1, 1,
                       1);
    insert_into_episode(2, 'Second Episode A', 'Continuation of the story for TV Show A', 1, 2,
                       1);
    insert_into_episode(3, 'Third Episode A', 'Another exciting episode of TV Show A', 1, 3,
                       1);
    insert_into_episode(4, 'Pilot Episode B', 'The first episode of TV Show B', 1, 1,
                       2);
    insert_into_episode(5, 'Second Episode B', 'Continuation of the story for TV Show B', 1, 2,
                       2);
    insert_into_episode(6, 'Third Episode B', 'Another exciting episode of TV Show B', 1, 3,
                       2);
    insert_into_episode(7, 'Pilot Episode C', 'The first episode of TV Show C', 1, 1,
                       3);
    insert_into_episode(8, 'Second Episode C', 'Continuation of the story for TV Show C', 1, 2,
                       3);
    insert_into_episode(9, 'Third Episode C', 'Another exciting episode of TV Show C', 1, 3,
                       3);
    insert_into_episode(10, 'Pilot Episode D', 'The first episode of TV Show D', 1, 1,
                       4);
    insert_into_episode(11, 'Second Episode D', 'Continuation of the story for TV Show D', 1, 2,
                       4);
    insert_into_episode(12, 'Third Episode D', 'Another exciting episode of TV Show D', 1, 3,
                       4);
    insert_into_episode(13, 'Pilot Episode E', 'The first episode of TV Show E', 1, 1,
                       5);
    insert_into_episode(14, 'Second Episode E', 'Continuation of the story for TV Show E', 1, 2,
                       5);
    insert_into_episode(15, 'Third Episode E', 'Another exciting episode of TV Show E', 1, 3,
                       5);
    insert_into_episode(16, 'Pilot Episode F', 'The first episode of TV Show F', 1, 1,
                       6);
    insert_into_episode(17, 'Second Episode F', 'Continuation of the story for TV Show F', 1, 2,
                       6);
    insert_into_episode(18, 'Third Episode F', 'Another exciting episode of TV Show F', 1, 3,
                       6);
    insert_into_episode(19, 'Pilot Episode G', 'The first episode of TV Show G', 1, 1,
                       7);
    insert_into_episode(20, 'Second Episode G', 'Continuation of the story for TV Show G', 1, 2,
                       7);
END;
/

SELECT
    *
FROM
    episode;
/

BEGIN
    insert_into_genre(1, 'Drama');
    insert_into_genre(2, 'Comedy');
    insert_into_genre(3, 'Action');
    insert_into_genre(4, 'Horror');
    insert_into_genre(5, 'Sci-Fi');
    insert_into_genre(6, 'Fantasy');
    insert_into_genre(7, 'Romance');
    insert_into_genre(8, 'Thriller');
    insert_into_genre(9, 'Documentary');
    insert_into_genre(10, 'Animation');
END;
/

SELECT
    *
FROM
    genre;
/

BEGIN
    insert_into_movie(1, 'Movie A', 'Description of Movie A', 2020, 'N',
                     1);
    insert_into_movie(2, 'Movie B', 'Description of Movie B', 2018, 'Y',
                     2);
    insert_into_movie(3, 'Movie C', 'Description of Movie C', 2019, 'N',
                     4);
    insert_into_movie(4, 'Movie D', 'Description of Movie D', 2021, 'Y',
                     10);
    insert_into_movie(5, 'Movie E', 'Description of Movie E', 2022, 'N',
                     3);
    insert_into_movie(6, 'Movie F', 'Description of Movie F', 2023, 'Y',
                     5);
    insert_into_movie(7, 'Movie G', 'Description of Movie G', 2022, 'N',
                     7);
    insert_into_movie(8, 'Movie H', 'Description of Movie H', 2021, 'Y',
                     6);
    insert_into_movie(9, 'Movie I', 'Description of Movie I', 2019, 'N',
                     9);
    insert_into_movie(10, 'Movie J', 'Description of Movie J', 2020, 'Y',
                     8);
END;
/

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
END;
/

SELECT
    *
FROM
    content_genre;
/

BEGIN
    insert_into_app_user(1, 'John', 'Doe', 'johndoe', TO_DATE('1990-01-15',
                         'yyyy-mm-dd'), 'johndoe@email.com');

    insert_into_app_user(2, 'Jane', 'Smith', 'janesmith', TO_DATE('1985-05-20',
                         'yyyy-mm-dd'), 'janesmith@email.com');

    insert_into_app_user(3, 'Michael', 'Johnson', 'michaelj', TO_DATE('1995-08-10',
                         'yyyy-mm-dd'), 'michaelj@email.com');

    insert_into_app_user(4, 'Emily', 'Brown', 'emilyb', TO_DATE('1988-03-25',
                         'yyyy-mm-dd'), 'emilyb@email.com');

    insert_into_app_user(5, 'David', 'Wilson', 'davidw', TO_DATE('1992-11-02',
                         'yyyy-mm-dd'), 'davidw@email.com');

    insert_into_app_user(6, 'Sarah', 'Johnson', 'sarahj', TO_DATE('1993-07-18',
                         'yyyy-mm-dd'), 'sarahj@email.com');

    insert_into_app_user(7, 'Robert', 'Miller', 'robertm', TO_DATE('1987-12-05',
                         'yyyy-mm-dd'), 'robertm@email.com');

    insert_into_app_user(8, 'Olivia', 'Lee', 'olivial', TO_DATE('1990-09-30',
                         'yyyy-mm-dd'), 'olivial@email.com');

    insert_into_app_user(9, 'Daniel', 'Anderson', 'danield', TO_DATE('1994-04-12',
                         'yyyy-mm-dd'), 'danield@email.com');

    insert_into_app_user(10, 'Sophia', 'Martinez', 'sophiam', TO_DATE('1986-02-28',
                         'yyyy-mm-dd'), 'sophiam@email.com');

END;
/

SELECT
    *
FROM
    app_user;
/

BEGIN
    -- Insert rows into user_preference
    insert_into_user_preference(1, 1, 2);
    insert_into_user_preference(2, 2, 1);
    insert_into_user_preference(3, 3, 3);
    insert_into_user_preference(4, 4, 4);
    insert_into_user_preference(5, 5, 5);
    insert_into_user_preference(6, 6, 6);
    insert_into_user_preference(7, 7, 7);
    insert_into_user_preference(8, 8, 8);
    insert_into_user_preference(9, 9, 9);
    insert_into_user_preference(10, 10, 10);
END;
/

SELECT
    *
FROM
    user_preference;

BEGIN
    insert_into_favorite_content(1, 1, 1, NULL);
    insert_into_favorite_content(2, 2, NULL, 2);
    insert_into_favorite_content(3, 3, 4, NULL);
    insert_into_favorite_content(4, 4, NULL, 5);
    insert_into_favorite_content(5, 5, NULL, 6);
    insert_into_favorite_content(6, 6, 8, NULL);
    insert_into_favorite_content(7, 7, NULL, 3);
    insert_into_favorite_content(8, 8, 2, NULL);
    insert_into_favorite_content(9, 9, NULL, 6);
    insert_into_favorite_content(10, 10, 10, NULL);
END;
/