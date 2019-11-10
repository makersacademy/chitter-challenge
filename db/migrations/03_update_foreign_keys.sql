ALTER TABLE peeps DROP COLUMN user_id;

ALTER TABLE users ADD CONSTRAINT uniquectm_const UNIQUE (handle);

ALTER TABLE peeps ADD COLUMN user_handle VARCHAR;
