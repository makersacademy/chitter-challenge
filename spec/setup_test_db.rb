require 'pg'

def setup_test_db
    con = PG.connect :dbname => 'chitter_test'

    con.exec("TRUNCATE posts;")
end
