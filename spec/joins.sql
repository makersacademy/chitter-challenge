-- all from both tables by single users id
SELECT users.id AS "users_id", users.name, users.username, users.email, users.password, peeps.body, peeps.time, peeps.tags, peeps.user_id AS "user_ID" , peeps.id AS "peeps_id"
FROM users
JOIN peeps
ON peeps.user_id = users.id
WHERE users.id = 1;

-- all users and peeps fields for all users and peeps
SELECT users.id AS "users_id", users.name, users.username, users.email, users.password, peeps.body, peeps.time, peeps.tags, peeps.user_id AS "user_ID" , peeps.id AS "peeps_id"
FROM users
JOIN peeps
ON peeps.user_id = users.id
;

-- all peeps with only the username taken from users
SELECT users.username, peeps.body, peeps.time, peeps.tags, peeps.user_id
FROM users
JOIN peeps
ON peeps.user_id = users.id
;