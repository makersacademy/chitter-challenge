ALTER TABLE peeps ADD CONSTRAINT fk_peeps_users FOREIGN KEY(user_id) REFERENCES users(id);