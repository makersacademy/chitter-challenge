TRUNCATE TABLE posts RESTART IDENTITY; -- replace with your own table name.

INSERT INTO posts (message, time_created, user_id) VALUES ('If you want to know what a man’s like, take a good look at how he treats his inferiors, not his equals.' , CURRENT_TIMESTAMP, '1');
INSERT INTO posts (message, time_created, user_id) VALUES ('No good sittin’ worryin’ abou’ it. What’s comin’ will come, an’ we’ll meet it when it does.', CURRENT_TIMESTAMP, '2');
