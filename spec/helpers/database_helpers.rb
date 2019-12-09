require 'pg'

def truncate_peeps
  connect_to_test_db { |con| con.exec "TRUNCATE TABLE peeps" }
end

def truncate_users
  connect_to_test_db { |con| con.exec "TRUNCATE TABLE users" }
end

def add_to_peeps content:, user: 1, time: Time.now.utc
  command = "INSERT INTO peeps (user_id, content, created_at, updated_at) "
  command << "VALUES (#{user}, '#{content}', '#{time}', '#{time}')"
  connect_to_test_db { |con| con.exec command }
end

=begin
def add_to_users name:, email:, username:, password:
  command = "INSERT INTO users (name, email, username, password) "
  command << "VALUES ('#{name}', '#{email}', #{username}, #{password})"
  connect_to_test_db { |con| con.exec command }
end
=end

def connect_to_test_db
  con = PG.connect dbname: "chitter_test"

  yield con if block_given?
ensure
  con&.close
end
