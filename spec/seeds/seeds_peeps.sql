TRUNCATE TABLE peeps RESTART IDENTITY;

INSERT INTO peeps (message, created_at, user_id) VALUES ('Eating Breakfast', '2002-12-02 08:23:54', 1);
INSERT INTO peeps (message, created_at, user_id) VALUES ('Checking Slack', '2002-12-02 10:06:23', 1);
INSERT INTO peeps (message, created_at, user_id) VALUES ('Going for a walk', '2002-12-02 12:39:42', 2);
