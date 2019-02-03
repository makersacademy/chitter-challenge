# Sets up peeps tabld
CREATE TABLE peeps (
    id SERIAL,
    message VARCHAR(280),
    created VARCHAR(60),
    userID int,
    PRIMARY KEY (id),
    FOREIGN KEY (userID) REFERENCES users(id) ON UPDATE CASCADE ON DELETE CASCADE);
