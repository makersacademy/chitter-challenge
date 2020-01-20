/* This is done for the test database also */ 

ALTER TABLE peeps
ADD userid INTEGER; 

ALTER TABLE peeps
ADD FOREIGN KEY (userid) REFERENCES users(id) 
ON DELETE CASCADE;