require 'pg'

def set_up_test_database!

    p "Setting up test database..."

    con = PG.connect :dbname => 'chitter_test'

    con.exec("TRUNCATE chitter_table;")

    con.exec("INSERT INTO chitter_table(user_id, peep) VALUES ('test_user', 'Peep peep!');")

end
