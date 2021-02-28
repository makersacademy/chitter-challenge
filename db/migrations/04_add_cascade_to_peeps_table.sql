ALTER TABLE peeps
  DROP CONSTRAINT peeps_user_id_fkey,
  ADD CONSTRAINT peeps_user_id_fkey
    FOREIGN KEY (user_id)
    REFERENCES users (id)
    ON DELETE CASCADE;
