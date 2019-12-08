require 'pg'

def truncate_peeps
  con = PG.connect dbname: "chitter_test"

  con.exec "TRUNCATE TABLE peeps"
ensure
  con.close if con
end

def add_to_peeps content:, user: 1
  con = PG.connect dbname: "chitter_test"

  con.exec "INSERT INTO peeps (user_id, content) VALUES (#{user}, '#{content}')"
ensure
  con.close
end
