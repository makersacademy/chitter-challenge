p 'Setting up test database...'

require 'pg'

connection = PG.connect(dbname: 'chitter_test')
connection.exec("TRUNCATE peeps;
INSERT INTO peeps (post) VALUES('This is a test peep');
INSERT INTO peeps (post) VALUES('Look at me; I''m peeping!');
INSERT INTO peeps (post) VALUES('Who wants to follow me?');")
