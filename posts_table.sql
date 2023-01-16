DROP TABLE IF EXISTS posts;

-- Table Definition
CREATE TABLE posts (
    id SERIAL PRIMARY KEY,
    post_time timestamp,
    message text,
    user_id int,
    CONSTRAINT fk_user
        FOREIGN KEY(user_id)
            REFERENCES users(id)
                ON DELETE CASCADE
);

-- DATETIME - format: YYYY-MM-DD HH:MI:SS





