SET SERVEROUTPUT ON;

BEGIN
    insert_productioncompany_pkg.insert_into_production_co('Company A', 'Headquarters A');
    insert_productioncompany_pkg.insert_into_production_co('Company B', 'Headquarters B');
    insert_productioncompany_pkg.insert_into_production_co('Company C', 'Headquarters C');
    insert_productioncompany_pkg.insert_into_production_co('Company D', 'Headquarters D');
    insert_productioncompany_pkg.insert_into_production_co('Company E', 'Headquarters E');
    insert_productioncompany_pkg.insert_into_production_co('Company F', 'Headquarters F');
    insert_productioncompany_pkg.insert_into_production_co('Company G', 'Headquarters G');
    insert_productioncompany_pkg.insert_into_production_co('Company H', 'Headquarters H');
    insert_productioncompany_pkg.insert_into_production_co('Company I', 'Headquarters I');
    insert_productioncompany_pkg.insert_into_production_co('Company J', 'Headquarters J');
EXCEPTION
    WHEN OTHERS THEN
        dbms_output.put_line('Error inserting into production_co: ' || sqlerrm);
END;
/

SELECT
    *
FROM
    production_co;

BEGIN
    insert_productioncompany_pkg.insert_into_tv_show('TV Show A', 'Description of TV Show A', 2020, 'N', 5,
                                                    1);
    insert_productioncompany_pkg.insert_into_tv_show('TV Show B', 'Description of TV Show B', 2018, 'Y', 6,
                                                    2);
    insert_productioncompany_pkg.insert_into_tv_show('TV Show C', 'Description of TV Show C', 2019, 'N', 4,
                                                    4);
    insert_productioncompany_pkg.insert_into_tv_show('TV Show D', 'Description of TV Show D', 2021, 'Y', 7,
                                                    10);
    insert_productioncompany_pkg.insert_into_tv_show('TV Show E', 'Description of TV Show E', 2022, 'N', 5,
                                                    3);
    insert_productioncompany_pkg.insert_into_tv_show('TV Show F', 'Description of TV Show F', 2023, 'Y', 8,
                                                    5);
    insert_productioncompany_pkg.insert_into_tv_show('TV Show G', 'Description of TV Show G', 2020, 'N', 6,
                                                    7);
    insert_productioncompany_pkg.insert_into_tv_show('TV Show H', 'Description of TV Show H', 2019, 'Y', 5,
                                                    6);
    insert_productioncompany_pkg.insert_into_tv_show('TV Show I', 'Description of TV Show I', 2022, 'N', 7,
                                                    9);
    insert_productioncompany_pkg.insert_into_tv_show('TV Show J', 'Description of TV Show J', 2021, 'Y', 6,
                                                    8);
EXCEPTION
    WHEN OTHERS THEN
        dbms_output.put_line('Error inserting into tv_show: ' || sqlerrm);
END;
/

SELECT
    *
FROM
    tv_show;

BEGIN
    insert_productioncompany_pkg.insert_into_episode('Pilot Episode A', 'The first episode of TV Show A', 1, 1, 1);
    insert_productioncompany_pkg.insert_into_episode('Second Episode A', 'Continuation of the story for TV Show A', 1, 2, 1);
    insert_productioncompany_pkg.insert_into_episode('Third Episode A', 'Another exciting episode of TV Show A', 1, 3, 1);
    insert_productioncompany_pkg.insert_into_episode('Pilot Episode B', 'The first episode of TV Show B', 1, 1, 2);
    insert_productioncompany_pkg.insert_into_episode('Second Episode B', 'Continuation of the story for TV Show B', 1, 2, 2);
    insert_productioncompany_pkg.insert_into_episode('Third Episode B', 'Another exciting episode of TV Show B', 1, 3, 2);
    insert_productioncompany_pkg.insert_into_episode('Pilot Episode C', 'The first episode of TV Show C', 1, 1, 3);
    insert_productioncompany_pkg.insert_into_episode('Second Episode C', 'Continuation of the story for TV Show C', 1, 2, 3);
    insert_productioncompany_pkg.insert_into_episode('Third Episode C', 'Another exciting episode of TV Show C', 1, 3, 3);
    insert_productioncompany_pkg.insert_into_episode('Pilot Episode D', 'The first episode of TV Show D', 1, 1, 4);
    insert_productioncompany_pkg.insert_into_episode('Second Episode D', 'Continuation of the story for TV Show D', 1, 2, 4);
    insert_productioncompany_pkg.insert_into_episode('Third Episode D', 'Another exciting episode of TV Show D', 1, 3, 4);
    insert_productioncompany_pkg.insert_into_episode('Pilot Episode E', 'The first episode of TV Show E', 1, 1, 5);
    insert_productioncompany_pkg.insert_into_episode('Second Episode E', 'Continuation of the story for TV Show E', 1, 2, 5);
    insert_productioncompany_pkg.insert_into_episode('Third Episode E', 'Another exciting episode of TV Show E', 1, 3, 5);
    insert_productioncompany_pkg.insert_into_episode('Pilot Episode F', 'The first episode of TV Show F', 1, 1, 6);
    insert_productioncompany_pkg.insert_into_episode('Second Episode F', 'Continuation of the story for TV Show F', 1, 2, 6);
    insert_productioncompany_pkg.insert_into_episode('Third Episode F', 'Another exciting episode of TV Show F', 1, 3, 6);
    insert_productioncompany_pkg.insert_into_episode('Pilot Episode G', 'The first episode of TV Show G', 1, 1, 7);
    insert_productioncompany_pkg.insert_into_episode('Second Episode G', 'Continuation of the story for TV Show G', 1, 2, 7);
EXCEPTION
    WHEN OTHERS THEN
        dbms_output.put_line('Error inserting into episode: ' || sqlerrm);
END;
/

SELECT
    *
FROM
    episode;
/

BEGIN
    insert_productioncompany_pkg.insert_into_movie('Movie A', 'Description of Movie A', 2020, 'N', 1);
    insert_productioncompany_pkg.insert_into_movie('Movie B', 'Description of Movie B', 2018, 'Y', 2);
    insert_productioncompany_pkg.insert_into_movie('Movie C', 'Description of Movie C', 2019, 'N', 4);
    insert_productioncompany_pkg.insert_into_movie('Movie D', 'Description of Movie D', 2021, 'Y', 10);
    insert_productioncompany_pkg.insert_into_movie('Movie E', 'Description of Movie E', 2022, 'N', 3);
    insert_productioncompany_pkg.insert_into_movie('Movie F', 'Description of Movie F', 2023, 'Y', 5);
    insert_productioncompany_pkg.insert_into_movie('Movie G', 'Description of Movie G', 2022, 'N', 7);
    insert_productioncompany_pkg.insert_into_movie('Movie H', 'Description of Movie H', 2021, 'Y', 6);
    insert_productioncompany_pkg.insert_into_movie('Movie I', 'Description of Movie I', 2019, 'N', 9);
    insert_productioncompany_pkg.insert_into_movie('Movie J', 'Description of Movie J', 2020, 'Y', 8);
EXCEPTION
    WHEN OTHERS THEN
        dbms_output.put_line('Error inserting into movie: ' || sqlerrm);
END;
/

COMMIT;