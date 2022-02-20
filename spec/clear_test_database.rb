require "pg"

def clear_test_database
  conn = PG.connect(dbname: "chitter_test")
  conn.exec("TRUNCATE TABLE peeps, users;")
end
