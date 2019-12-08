require 'pg'

def truncate_peeps
  con = PG.connect dbname: "chitter_test"

  con.exec "TRUNCATE TABLE peeps"
ensure
  con.close if con
end

def add_to_peeps content:, user: 1, time: Time.now.utc
  con = PG.connect dbname: "chitter_test"

  con.exec "INSERT INTO peeps (user_id, content, created_at, updated_at) VALUES (#{user}, '#{content}', '#{time}', '#{time}')"
ensure
  con.close
end
