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