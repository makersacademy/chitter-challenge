-- password verification
SELECT users.id, hashed_passwords.id, user_fk, hash, salt
FROM users
         JOIN hashed_passwords
              ON users.id = user_fk

