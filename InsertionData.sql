BEGIN
    insert_productioncompany_pkg.insert_into_tv_show('Breaking Bad', 'High school chemistry teacher turned methamphetamine producer.', 2008, 'N', 5, 1);
    insert_productioncompany_pkg.insert_into_tv_show('Stranger Things', 'Supernatural events in a small town.', 2016, 'N', 4, 2);
    insert_productioncompany_pkg.insert_into_tv_show('The Mandalorian', 'Space western in the Star Wars universe.', 2019, 'N', 3, 3);
    insert_productioncompany_pkg.insert_into_tv_show('Game of Thrones', 'Political and dynastic struggles in the Seven Kingdoms.', 2011, 'Y', 8, 4);
    insert_productioncompany_pkg.insert_into_tv_show('The Witcher', 'Monster hunter in a medieval-inspired world.', 2019, 'Y', 2, 5);
    insert_productioncompany_pkg.insert_into_tv_show('Friends', 'Life and adventures of a group of friends in New York.', 1994, 'N', 10, 6);
    insert_productioncompany_pkg.insert_into_tv_show('Black Mirror', 'Anthology series exploring the dark side of technology.', 2011, 'Y', 5, 7);
    insert_productioncompany_pkg.insert_into_tv_show('The Office', 'Mockumentary on the everyday lives of office employees.', 2005, 'N', 9, 8);
    insert_productioncompany_pkg.insert_into_tv_show('The Crown', 'Chronicles the reign of Queen Elizabeth II.', 2016, 'N', 6, 9);
    insert_productioncompany_pkg.insert_into_tv_show('Narcos', 'Depicts the rise and fall of drug cartels in Colombia.', 2015, 'Y', 3, 10);
    insert_productioncompany_pkg.insert_into_tv_show('Westworld', 'Theme park with human-like robots and moral dilemmas.', 2016, 'Y', 4, 11);
    insert_productioncompany_pkg.insert_into_tv_show('Sherlock', 'Modern-day adaptation of Arthur Conan Doyles Sherlock Holmes.', 2010, 'N', 4, 12);
    insert_productioncompany_pkg.insert_into_tv_show('The Simpsons', 'Satirical depiction of a middle-class American family.', 1989, 'N', 33, 13);
    insert_productioncompany_pkg.insert_into_tv_show('The Big Bang Theory', 'Lives of socially awkward physicists.', 2007, 'N', 12, 14);
    insert_productioncompany_pkg.insert_into_tv_show('Rick and Morty', 'Adventures of an eccentric scientist and his good-hearted grandson.', 2013, 'Y', 5, 15);
    insert_productioncompany_pkg.insert_into_tv_show('The Sopranos', 'Life of mob boss Tony Soprano.', 1999, 'Y', 6, 16);
    insert_productioncompany_pkg.insert_into_tv_show('Breaking Bad', 'High school chemistry teacher turned methamphetamine producer.', 2008, 'N', 5, 1);
    insert_productioncompany_pkg.insert_into_tv_show('Money Heist', 'Criminal mastermind and his team execute heists on the Royal Mint of Spain.', 2017, 'Y', 5, 17);
    insert_productioncompany_pkg.insert_into_tv_show('Peaky Blinders', 'Gangster family epic set in Birmingham, England, after World War I.', 2013, 'Y', 6, 18);
    insert_productioncompany_pkg.insert_into_tv_show('Fargo', 'Anthology series inspired by the 1996 film.', 2014, 'Y', 4, 19);
END;



-- Generated procedures for inserting data into the episode table, associating with TV shows
BEGIN
    insert_productioncompany_pkg.insert_into_episode('Pilot Episode A', 'The first episode of Breaking Bad', 1, 1, 1);
    insert_productioncompany_pkg.insert_into_episode('Episode 2 of Breaking Bad', 'Description of Episode 2 of Breaking Bad', 1, 2, 1);
    insert_productioncompany_pkg.insert_into_episode('Season Finale of Breaking Bad', 'Description of Season Finale of Breaking Bad', 1, 3, 1);
    insert_productioncompany_pkg.insert_into_episode('Pilot Episode of Stranger Things', 'The first episode of Stranger Things', 1, 1, 2);
    insert_productioncompany_pkg.insert_into_episode('The New Beginning of Stranger Things', 'Description of The New Beginning of Stranger Things', 1, 2, 2);
    insert_productioncompany_pkg.insert_into_episode('Special Episode X of The Mandalorian', 'A special episode for The Mandalorian', 3, 1, 3);
    insert_productioncompany_pkg.insert_into_episode('The Office Christmas Special of Game of Thrones', 'Christmas special of Game of Thrones', 2, 1, 4);
    insert_productioncompany_pkg.insert_into_episode('Coronation Episode of The Witcher', 'Coronation episode of The Witcher', 1, 1, 5);
    insert_productioncompany_pkg.insert_into_episode('Episode 4 of Friends', 'Description of Episode 4 of Friends', 1, 4, 6);
    insert_productioncompany_pkg.insert_into_episode('Game-Changing Finale of Black Mirror', 'Season finale of Black Mirror', 2, 8, 7);
    insert_productioncompany_pkg.insert_into_episode('The Hound Strikes Back of The Office', 'Episode featuring The Hound in The Office', 1, 7, 8);
    insert_productioncompany_pkg.insert_into_episode('Family Vacation Episode of The Crown', 'Special episode in The Crown', 1, 1, 9);
    insert_productioncompany_pkg.insert_into_episode('Episode 5 of Narcos', 'Description of Episode 5 of Narcos', 1, 5, 10);
    insert_productioncompany_pkg.insert_into_episode('The Sheldon Experiment of Westworld', 'Experiment episode in Westworld', 1, 3, 11);
    insert_productioncompany_pkg.insert_into_episode('The Mob Boss Returns of Sherlock', 'Return of the mob boss in Sherlock', 1, 2, 12);
    insert_productioncompany_pkg.insert_into_episode('Heist Episode of The Simpsons', 'Heist episode in The Simpsons', 2, 3, 13);
    insert_productioncompany_pkg.insert_into_episode('Season Premiere of The Big Bang Theory', 'Premiere episode of The Big Bang Theory', 1, 1, 14);
    insert_productioncompany_pkg.insert_into_episode('Episode 6 of Rick and Morty', 'Description of Episode 6 of Rick and Morty', 1, 6, 15);
    insert_productioncompany_pkg.insert_into_episode('Pilot Episode P', 'The first episode of Money Heist', 1, 1, 17);
    insert_productioncompany_pkg.insert_into_episode('Episode 2 of Peaky Blinders', 'Description of Episode 2 of Peaky Blinders', 1, 2, 18);
    insert_productioncompany_pkg.insert_into_episode('The Final Confrontation of Breaking Bad', 'Final showdown in Breaking Bad', 1, 4, 1);
    insert_productioncompany_pkg.insert_into_episode('Mysterious Events of Stranger Things', 'Unexplained events in Stranger Things', 2, 3, 2);
    insert_productioncompany_pkg.insert_into_episode('The Mandalorian's Quest Continues', 'Continuation of The Mandalorian\'s journey', 3, 2, 3);
    insert_productioncompany_pkg.insert_into_episode('The Battle for the Iron Throne', 'Epic battle for the Iron Throne in Game of Thrones', 8, 9, 4);
    insert_productioncompany_pkg.insert_into_episode('The Witcher's Hunt for Monsters', 'The Witcher's quest against monsters', 1, 2, 5);
    insert_productioncompany_pkg.insert_into_episode('The One with the Unexpected Twist in Friends', 'Unexpected twist in Friends', 10, 7, 6);
    insert_productioncompany_pkg.insert_into_episode('Black Mirror: The Mind-Bending Journey', 'Mind-bending journey in Black Mirror', 4, 5, 7);
    insert_productioncompany_pkg.insert_into_episode('The Pranks Continue in The Office', 'Continuation of pranks in The Office', 9, 6, 8);
    insert_productioncompany_pkg.insert_into_episode('Royal Challenges in The Crown', 'Challenges faced by the royals in The Crown', 2, 4, 9);
    insert_productioncompany_pkg.insert_into_episode('Narcos: Rise of New Cartels', 'New cartels emerge in Narcos', 3, 6, 10);
    insert_productioncompany_pkg.insert_into_episode('Westworld: The Moral Dilemmas Persist', 'Continued moral dilemmas in Westworld', 2, 4, 11);
    insert_productioncompany_pkg.insert_into_episode('Sherlock's New Case', 'Sherlock takes on a new mysterious case', 1, 3, 12);
    insert_productioncompany_pkg.insert_into_episode('The Simpsons: Springfield's Adventures', 'Adventures in Springfield in The Simpsons', 33, 2, 13);
    insert_productioncompany_pkg.insert_into_episode('The Big Bang Theory: Navigating Social Awkwardness', 'Dealing with social awkwardness in The Big Bang Theory', 12, 5, 14);
    insert_productioncompany_pkg.insert_into_episode('Rick and Morty: Multiverse Madness', 'Madness ensues in the multiverse in Rick and Morty', 5, 7, 15);
    insert_productioncompany_pkg.insert_into_episode('Money Heist: The Grand Heist Continues', 'Continuation of the grand heist in Money Heist', 5, 2, 17);
    insert_productioncompany_pkg.insert_into_episode('Peaky Blinders: Rise of the Shelby Empire', 'Shelby empire rises in Peaky Blinders', 6, 3, 18);
    -- Add more episodes as needed
END;

END;


-- Generated insert statements for the movie table
BEGIN
    insert_productioncompany_pkg.insert_into_movie('Inception', 'Mind-bending heist thriller.', 2010, 'N', 1);
    insert_productioncompany_pkg.insert_into_movie('The Dark Knight', 'Batman faces the Joker.', 2008, 'N', 1);
    insert_productioncompany_pkg.insert_into_movie('Forrest Gump', 'Life is like a box of chocolates.', 1994, 'N', 2);
    insert_productioncompany_pkg.insert_into_movie('The Shawshank Redemption', 'Redemption in Shawshank prison.', 1994, 'N', 2);
    insert_productioncompany_pkg.insert_into_movie('Pulp Fiction', 'Interwoven crime stories.', 1994, 'Y', 3);
    insert_productioncompany_pkg.insert_into_movie('The Godfather', 'Mafia drama.', 1972, 'N', 4);
    insert_productioncompany_pkg.insert_into_movie('The Matrix', 'Virtual reality and rebellion.', 1999, 'Y', 3);
    insert_productioncompany_pkg.insert_into_movie('Schindlers List', 'Holocaust drama.', 1993, 'N', 4);
    insert_productioncompany_pkg.insert_into_movie('Titanic', 'Romantic drama on the ill-fated ship.', 1997, 'N', 5);
    insert_productioncompany_pkg.insert_into_movie('Avatar', 'Science fiction epic on Pandora.', 2009, 'N', 5);
    insert_productioncompany_pkg.insert_into_movie('Jurassic Park', 'Dinosaurs come back to life.', 1993, 'N', 6);
    insert_productioncompany_pkg.insert_into_movie('The Silence of the Lambs', 'Psychological thriller.', 1991, 'Y', 7);
    insert_productioncompany_pkg.insert_into_movie('Inglourious Basterds', 'Quentin Tarantino\'s war film.', 2009, 'Y', 3);
    insert_productioncompany_pkg.insert_into_movie('The Departed', 'Undercover agents and organized crime.', 2006, 'Y', 4);
    insert_productioncompany_pkg.insert_into_movie('Saving Private Ryan', 'War drama during World War II.', 1998, 'N', 2);
    insert_productioncompany_pkg.insert_into_movie('Django Unchained', 'Tarantino's take on slavery.', 2012, 'Y', 3);
    insert_productioncompany_pkg.insert_into_movie('The Social Network', 'Founding of Facebook.', 2010, 'N', 7);
    insert_productioncompany_pkg.insert_into_movie('The Revenant', 'Survival in the wilderness.', 2015, 'Y', 6);
    insert_productioncompany_pkg.insert_into_movie('Braveheart', 'William Wallace and Scottish freedom.', 1995, 'Y', 8);
    insert_productioncompany_pkg.insert_into_movie('Gladiator', 'Roman general seeks revenge.', 2000, 'Y', 8);
END;


--insert into prod co
BEGIN
insert_productioncompany_pkg.insert_into_production_co('Sony Pictures Entertainment', 'Culver City, California, United States');
    insert_productioncompany_pkg.insert_into_production_co('Metro-Goldwyn-Mayer (MGM)', 'Beverly Hills, California, United States');
    insert_productioncompany_pkg.insert_into_production_co('DreamWorks Pictures', 'Universal City, California, United States');
    insert_productioncompany_pkg.insert_into_production_co('Columbia Pictures', 'Culver City, California, United States');
    insert_productioncompany_pkg.insert_into_production_co('Lionsgate Films', 'Santa Monica, California, United States');
    insert_productioncompany_pkg.insert_into_production_co('DreamWorks Animation', 'Glendale, California, United States');
    insert_productioncompany_pkg.insert_into_production_co('Focus Features', 'Universal City, California, United States');
    insert_productioncompany_pkg.insert_into_production_co('New Line Cinema', 'Burbank, California, United States');
    insert_productioncompany_pkg.insert_into_production_co('Fox Searchlight Pictures', 'Los Angeles, California, United States');
    insert_productioncompany_pkg.insert_into_production_co('Warner Bros. Pictures', 'Burbank, California, United States');
    insert_productioncompany_pkg.insert_into_production_co('Walt Disney Pictures', 'Burbank, California, United States');
    insert_productioncompany_pkg.insert_into_production_co('Universal Pictures', 'Universal City, California, United States');
    insert_productioncompany_pkg.insert_into_production_co('20th Century Studios', 'Century City, California, United States');
    insert_productioncompany_pkg.insert_into_production_co('Paramount Pictures', 'Hollywood, California, United States');
    insert_productioncompany_pkg.insert_into_production_co('Yash Raj Films', 'Mumbai, Maharashtra, India');
    insert_productioncompany_pkg.insert_into_production_co('Dharma Productions', 'Mumbai, Maharashtra, India');
    insert_productioncompany_pkg.insert_into_production_co('Eros International', 'Mumbai, Maharashtra, India');
    insert_productioncompany_pkg.insert_into_production_co('Reliance Entertainment', 'Mumbai, Maharashtra, India');
    insert_productioncompany_pkg.insert_into_production_co('T-Series', 'Noida, Uttar Pradesh, India');
    insert_productioncompany_pkg.insert_into_production_co('UTV Motion Pictures', 'Mumbai, Maharashtra, India');
    insert_productioncompany_pkg.insert_into_production_co('Red Chillies Entertainment', 'Mumbai, Maharashtra, India');
    insert_productioncompany_pkg.insert_into_production_co('Viacom18 Motion Pictures', 'Mumbai, Maharashtra, India');
    insert_productioncompany_pkg.insert_into_production_co('Excel Entertainment', 'Mumbai, Maharashtra, India');
    insert_productioncompany_pkg.insert_into_production_co('Balaji Motion Pictures', 'Mumbai, Maharashtra, India');


END;


BEGIN
EXEC INSERT_GENRE('Action');
EXEC INSERT_GENRE('Adventure');
EXEC INSERT_GENRE('Comedy');
EXEC INSERT_GENRE('Drama');
EXEC INSERT_GENRE('Fantasy');
EXEC INSERT_GENRE('Horror');
EXEC INSERT_GENRE('Mystery');
EXEC INSERT_GENRE('Romance');
EXEC INSERT_GENRE('Sci-Fi');
EXEC INSERT_GENRE('Thriller');
EXEC INSERT_GENRE('Western');
EXEC INSERT_GENRE('Animation');
EXEC INSERT_GENRE('Family');
EXEC INSERT_GENRE('Musical');
EXEC INSERT_GENRE('Crime');
EXEC INSERT_GENRE('Documentary');
EXEC INSERT_GENRE('History');
EXEC INSERT_GENRE('Sport');
EXEC INSERT_GENRE('War');
EXEC INSERT_GENRE('Biography');



END;



-- Generated insert procedures for the app_user table 
BEGIN
    insert_into_app_user('John', 'Doe', TO_DATE('1990-01-15', 'YYYY-MM-DD'), 'john.doe@gmail.com');
    insert_into_app_user('Jane', 'Smith', TO_DATE('1985-05-20', 'YYYY-MM-DD'), 'jane.smith@yahoo.com');
    insert_into_app_user('Michael', 'Johnson', TO_DATE('1992-08-10', 'YYYY-MM-DD'), 'michael.j@example.com');
    insert_into_app_user('Emily', 'Williams', TO_DATE('1988-03-25', 'YYYY-MM-DD'), 'emily.w@example.com');
    insert_into_app_user('David', 'Brown', TO_DATE('1995-11-05', 'YYYY-MM-DD'), 'david.brown@hotmail.com');
    insert_into_app_user('Jennifer', 'Taylor', TO_DATE('1982-07-12', 'YYYY-MM-DD'), 'jennifer.t@gmail.com');
    insert_into_app_user('Christopher', 'Anderson', TO_DATE('1993-04-08', 'YYYY-MM-DD'), 'chris.a@example.com');
    insert_into_app_user('Jessica', 'Thomas', TO_DATE('1991-09-18', 'YYYY-MM-DD'), 'jessica.t@gmail.com');
    insert_into_app_user('Matthew', 'Moore', TO_DATE('1986-12-30', 'YYYY-MM-DD'), 'matt.m@hotmail.com');
    insert_into_app_user('Ashley', 'Miller', TO_DATE('1984-02-14', 'YYYY-MM-DD'), 'ashley.m@example.com');
    insert_into_app_user('Daniel', 'Clark', TO_DATE('1989-06-22', 'YYYY-MM-DD'), 'daniel.c@yahoo.com');
    insert_into_app_user('Amanda', 'Walker', TO_DATE('1994-10-03', 'YYYY-MM-DD'), 'amanda.w@gmail.com');
    insert_into_app_user('Brian', 'Perez', TO_DATE('1987-07-08', 'YYYY-MM-DD'), 'brian.p@hotmail.com');
    insert_into_app_user('Olivia', 'Gonzalez', TO_DATE('1996-04-16', 'YYYY-MM-DD'), 'olivia.g@gmail.com');
    insert_into_app_user('Ryan', 'Martinez', TO_DATE('1983-11-28', 'YYYY-MM-DD'), 'ryan.m@example.com');
    insert_into_app_user('Megan', 'Hill', TO_DATE('1997-08-05', 'YYYY-MM-DD'), 'megan.h@gmail.com');
    insert_into_app_user('Andrew', 'Wright', TO_DATE('1981-01-09', 'YYYY-MM-DD'), 'andrew.w@example.com');
    insert_into_app_user('Lauren', 'Lopez', TO_DATE('1980-06-14', 'YYYY-MM-DD'), 'lauren.l@hotmail.com');
    insert_into_app_user('Justin', 'Young', TO_DATE('1998-02-22', 'YYYY-MM-DD'), 'justin.y@gmail.com');
    insert_into_app_user('Samantha', 'Harris', TO_DATE('1989-09-29', 'YYYY-MM-DD'), 'samantha.h@example.com');
END;



-- Generated insert procedures for the user_preference table with genre combinations
BEGIN
    insert_into_user_preference(1, 1);
    insert_into_user_preference(1, 2);
    insert_into_user_preference(1, 3);

    insert_into_user_preference(2, 4);
    insert_into_user_preference(2, 5);
    insert_into_user_preference(2, 6);

    insert_into_user_preference(3, 7);
    insert_into_user_preference(3, 8);
    insert_into_user_preference(3, 9);

    insert_into_user_preference(4, 10);
    insert_into_user_preference(4, 11);
    insert_into_user_preference(4, 12);

    insert_into_user_preference(5, 13);
    insert_into_user_preference(5, 14);
    insert_into_user_preference(5, 15);

    insert_into_user_preference(6, 16);
    insert_into_user_preference(6, 17);
    insert_into_user_preference(6, 18);

    insert_into_user_preference(7, 19);
    insert_into_user_preference(7, 20);
    insert_into_user_preference(7, 1);

    insert_into_user_preference(8, 2);
    insert_into_user_preference(8, 3);
    insert_into_user_preference(8, 4);

    insert_into_user_preference(9, 5);
    insert_into_user_preference(9, 6);
    insert_into_user_preference(9, 7);

    insert_into_user_preference(10, 8);
    insert_into_user_preference(10, 9);
    insert_into_user_preference(10, 10);

    insert_into_user_preference(11, 11);
    insert_into_user_preference(11, 12);
    insert_into_user_preference(11, 13);

    insert_into_user_preference(12, 14);
    insert_into_user_preference(12, 15);
    insert_into_user_preference(12, 16);

    insert_into_user_preference(13, 17);
    insert_into_user_preference(13, 18);
    insert_into_user_preference(13, 19);

    insert_into_user_preference(14, 20);
    insert_into_user_preference(14, 1);
    insert_into_user_preference(14, 2);

    insert_into_user_preference(15, 3);
    insert_into_user_preference(15, 4);
    insert_into_user_preference(15, 5);

    insert_into_user_preference(16, 6);
    insert_into_user_preference(16, 7);
    insert_into_user_preference(16, 8);

    insert_into_user_preference(17, 9);
    insert_into_user_preference(17, 10);
    insert_into_user_preference(17, 11);

    insert_into_user_preference(18, 12);
    insert_into_user_preference(18, 13);
    insert_into_user_preference(18, 14);

    insert_into_user_preference(19, 15);
    insert_into_user_preference(19, 16);
    insert_into_user_preference(19, 17);

    insert_into_user_preference(20, 18);
    insert_into_user_preference(20, 19);
    insert_into_user_preference(20, 20);
END;


BEGIN
    insert_into_favorite_content(1, 1, NULL); -- TV Show for user John Doe
    insert_into_favorite_content(2, NULL, 1); -- Movie for user Jane Smith
    insert_into_favorite_content(3, 2, NULL); -- TV Show for user Michael Johnson
    insert_into_favorite_content(4, NULL, 2); -- Movie for user Emily Williams
    insert_into_favorite_content(5, 3, NULL); -- TV Show for user David Brown
    insert_into_favorite_content(6, NULL, 3); -- Movie for user Jennifer Taylor
    insert_into_favorite_content(7, 4, NULL); -- TV Show for user Christopher Anderson
    insert_into_favorite_content(8, NULL, 4); -- Movie for user Jessica Thomas
    insert_into_favorite_content(9, 5, NULL); -- TV Show for user Matthew Moore
    insert_into_favorite_content(10, NULL, 5); -- Movie for user Ashley Miller
    insert_into_favorite_content(11, 6, NULL); -- TV Show for user Daniel Clark
    insert_into_favorite_content(12, NULL, 6); -- Movie for user Amanda Walker
    insert_into_favorite_content(13, 7, NULL); -- TV Show for user Brian Perez
    insert_into_favorite_content(14, NULL, 7); -- Movie for user Olivia Gonzalez
    insert_into_favorite_content(15, 8, NULL); -- TV Show for user Ryan Martinez
    insert_into_favorite_content(16, NULL, 8); -- Movie for user Megan Hill
    insert_into_favorite_content(17, 9, NULL); -- TV Show for user Andrew Wright
    insert_into_favorite_content(18, NULL, 9); -- Movie for user Lauren Lopez
    insert_into_favorite_content(19, 10, NULL); -- TV Show for user Justin Young
    insert_into_favorite_content(20, NULL, 10); -- Movie for user Samantha Harris
    -- User John Doe
    insert_into_favorite_content(1, 1, NULL); -- TV Show
    insert_into_favorite_content(1, 2, NULL); -- Another TV Show
    insert_into_favorite_content(1, NULL, 1); -- Movie
    -- User Jane Smith
    insert_into_favorite_content(2, NULL, 1); -- Movie
    insert_into_favorite_content(2, NULL, 2); -- Another Movie
    insert_into_favorite_content(2, 1, NULL); -- TV Show
    -- User Michael Johnson
    insert_into_favorite_content(3, 2, NULL); -- TV Show
    insert_into_favorite_content(3, NULL, 2); -- Movie
    insert_into_favorite_content(3, NULL, 3); -- Another Movie
    
    -- User John Doe
    insert_into_favorite_content(1, 1, NULL); -- TV Show
    insert_into_favorite_content(1, 2, NULL); -- Another TV Show
    insert_into_favorite_content(1, NULL, 1); -- Movie
    -- User Jane Smith
    insert_into_favorite_content(2, NULL, 1); -- Movie
    insert_into_favorite_content(2, NULL, 2); -- Another Movie
    insert_into_favorite_content(2, 1, NULL); -- TV Show
    -- User Michael Johnson
    insert_into_favorite_content(3, 2, NULL); -- TV Show
    insert_into_favorite_content(3, NULL, 2); -- Movie
    insert_into_favorite_content(3, NULL, 3); -- Another Movie

END;

BEGIN
    -- Sample Data for Content Genre
    insert_into_content_genre(1, 1, NULL); -- Genre 1 for TV Show 1
    insert_into_content_genre(2, 1, NULL); -- Genre 2 for TV Show 1
    insert_into_content_genre(3, 2, NULL); -- Genre 3 for TV Show 2
    insert_into_content_genre(1, NULL, 1); -- Genre 1 for Movie 1
    insert_into_content_genre(2, NULL, 2); -- Genre 2 for Movie 2
    insert_into_content_genre(3, 3, NULL); -- Genre 3 for TV Show 3
    insert_into_content_genre(1, NULL, 3); -- Genre 1 for Movie 3
    insert_into_content_genre(4, 4, NULL); -- Genre 4 for TV Show 4
    insert_into_content_genre(2, NULL, 4); -- Genre 2 for Movie 4
    insert_into_content_genre(5, 5, NULL); -- Genre 5 for TV Show 5
    insert_into_content_genre(1, NULL, 5); -- Genre 1 for Movie 5
    insert_into_content_genre(3, 6, NULL); -- Genre 3 for TV Show 6
    insert_into_content_genre(4, NULL, 6); -- Genre 4 for Movie 6
    insert_into_content_genre(2, NULL, 7); -- Genre 2 for Movie 7
    insert_into_content_genre(5, 8, NULL); -- Genre 5 for TV Show 8
    insert_into_content_genre(3, NULL, 8); -- Genre 3 for Movie 8
    insert_into_content_genre(1, NULL, 9); -- Genre 1 for Movie 9
    insert_into_content_genre(4, 10, NULL); -- Genre 4 for TV Show 10
    insert_into_content_genre(2, NULL, 10); -- Genre 2 for Movie 10
    insert_into_content_genre(5, NULL, 11); -- Genre 5 for Movie 11
    insert_into_content_genre(3, 1, NULL); -- Genre 3 for TV Show 1
    insert_into_content_genre(4, NULL, 3); -- Genre 4 for Movie 3
    insert_into_content_genre(5, 2, NULL); -- Genre 5 for TV Show 2
    insert_into_content_genre(2, NULL, 7); -- Genre 2 for Movie 7
    insert_into_content_genre(4, 4, NULL); -- Genre 4 for TV Show 4
    insert_into_content_genre(3, NULL, 9); -- Genre 3 for Movie 9
    insert_into_content_genre(1, NULL, 2); -- Genre 1 for Movie 2
    insert_into_content_genre(5, 5, NULL); -- Genre 5 for TV Show 5
    insert_into_content_genre(2, NULL, 11); -- Genre 2 for Movie 11
    insert_into_content_genre(3, 6, NULL); -- Genre 3 for TV Show 6
    insert_into_content_genre(4, NULL, 12); -- Genre 4 for Movie 12
    insert_into_content_genre(1, 7, NULL); -- Genre 1 for TV Show 7
    insert_into_content_genre(5, 8, NULL); -- Genre 5 for TV Show 8
    insert_into_content_genre(2, NULL, 4); -- Genre 2 for Movie 4
    insert_into_content_genre(3, NULL, 10); -- Genre 3 for Movie 10
    insert_into_content_genre(4, 9, NULL); -- Genre 4 for TV Show 9
    insert_into_content_genre(2, NULL, 5); -- Genre 2 for Movie 5
    insert_into_content_genre(5, 11, NULL); -- Genre 5 for TV Show 11
    insert_into_content_genre(1, NULL, 8); -- Genre 1 for Movie 8
    insert_into_content_genre(3, 10, NULL); -- Genre 3 for TV Show 10
    insert_into_content_genre(4, NULL, 13); -- Genre 4 for Movie 13
    insert_into_content_genre(2, NULL, 14); -- Genre 2 for Movie 14
    insert_into_content_genre(5, 12, NULL); -- Genre 5 for TV Show 12
    insert_into_content_genre(1, NULL, 15); -- Genre 1 for Movie 15
    insert_into_content_genre(3, 13, NULL); -- Genre 3 for TV Show 13
    insert_into_content_genre(4, NULL, 16); -- Genre 4 for Movie 16
    insert_into_content_genre(2, 14, NULL); -- Genre 2 for TV Show 14
    insert_into_content_genre(5, NULL, 17); -- Genre 5 for Movie 17
    insert_into_content_genre(1, 15, NULL); -- Genre 1 for TV Show 15
    insert_into_content_genre(3, NULL, 18); -- Genre 3 for Movie 18
END;

