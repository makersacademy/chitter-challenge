require 'pg'

def truncates
  connection = PG.connect(dbname: 'chitter_test')
  connection.exec('TRUNCATE TABLE users, peeps')
end

def add_test_users
  connection = PG.connect(dbname: 'chitter_test')
  
  Users.create(name: 'test name', email: 'test@email.com', password: 'pword123', username: 'test_username')

  Users.create(name: "a", email: 'a@email.com', password: 'a456', username: 'a_user')

  Users.create(name: "b", email: 'b@gmail.com', password: 'b282130972##', username: 'b-user')
end

def test_user
  Users.create(name: 'test name', email: 'test@email.com', password: 'pword123', username: 'test_username')
end

def persisted_data(table:, id:)
  connection = PG.connect(dbname: 'chitter_test')
  result = connection.query("SELECT * FROM #{table} WHERE id = #{id};")
  result.first
end

def sign_up
  click_on('sign up')
  fill_in('name', with: 'Bingo Boingo')
  fill_in('email', with: 'test_email@email.com')
  fill_in('password', with: 'testpassword123')
  fill_in('username', with: 'bingo01')
  click_on('sign up')
end
