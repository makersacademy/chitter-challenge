/* this SQL creates a users table that will store a table of individual peeps 
from users with an id and peep details (limited to 1400 characters) along with date
which will i hope be used to store the date of the peep */


/* 
This is the syntax to add to the table.... 
INSERT INTO peeps VALUES(1, 'First peep!!', TO_DATE('15/03/2019', 'DD/MM/YYYY'));
*/

CREATE TABLE peeps
( 
  id SERIAL PRIMARY KEY,
  peep VARCHAR(140),
  date DATE
);
