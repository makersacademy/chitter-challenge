TRUNCATE TABLE users, posts  RESTART IDENTITY;

INSERT INTO users (username, email, password) VALUES 
('micheal23', 'micheal_james@gmail.com', '123456'),
('fred23', 'fred-manu@gmail.com', 'ilovemymom456'),
('james-lewis', 'james-lewis333@gmail.com', 'summin-summin!2323'),
('rico-franco', 'rico_fr@gmail.com', 'bGVmdHJpZ2h0Z2RuaWdodCEyMzIz\n'),
('david-d', 'david-damion@gmail.com', '!Ffg$g'),
('sl', 'simone_perrins@hotmail.com', 'ballsofmustard');

INSERT INTO posts (content, date_created, user_id) VALUES 
('Took the plunge. Dealing with the fall-out. About to secure my freedom from the evil tentacled monster. Takes 12 steps, but I hit a brick wall at 8.

Took time off to recuperate and recover my energy. Now back from paradise, rejuvenated and ready to take on the beast again. All eyes on the prize, one more trip to deliver the coup de grace to that other beast in the west. Once thats done, its just a matter of time and protocol until the next step is reached.

Its scary and new, but isnt that just what makes it all so deliciously exciting?', '11:22', 4),
('hot take: vine is the american dream', '12/6/22', 5),
('i always daydream about how kanye west will save the economy', '12/6/22', 4),
('i hate how running away from home and joining the circus is not as bad as everyone thinks', '12/6/22', 3),
('i always daydream about how the bee movie (2007) is fake news', '12/6/22', 2),
('u know what pisses me off? the fact that the dark side of the moon is fake.', '12/6/22', 1);
