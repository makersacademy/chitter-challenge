require 'pg'

def setup_test_database
p "Setting up test database..."

connection = PG.connect(dbname: 'chitter_test')

connection.exec("TRUNCATE users RESTART IDENTITY CASCADE;")

connection.exec("INSERT INTO users (username, name, email, password) 
                VALUES ('j_smith', 'John Smith', 'j.s@domain.com', 'password123'),
                       ('s_smith', 'Sally Smith', 'ssmith@domain.com', 'paSSword123');")

connection.exec("insert into peeps (peep_body) values ('Test peep');")

end

