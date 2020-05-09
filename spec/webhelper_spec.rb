def empty_and_fill_test_db
  connection = PG.connect :dbname => 'chitter_test'
  connection.exec "TRUNCATE TABLE peeps"
  connection.exec "TRUNCATE TABLE users"
  time = Time.new
  connection.exec "INSERT INTO peeps (timestamp, body, user_handle, real_name) VALUES ('#{time}','test1 test1 test1','Jim1984','Jimmy')"
  connection.exec "INSERT INTO peeps (timestamp, body, user_handle, real_name) VALUES ('#{time}','test2 test2 test2','Jim1984','Jimmy')"
  connection.exec "INSERT INTO peeps (timestamp, body, user_handle, real_name) VALUES ('#{time}','test3 test3 test3','Jim1984','Jimmy')"
  connection.exec "INSERT INTO users (email, real_name, user_handle, password) VALUES ('test@test.com','Jimmy','Jim1984','password')"
end

def signup_test
  visit '/' 
  click_link('signup')
  expect(page).to have_content "Please enter data to signup to Chitter"
  fill_in('real_name', with: 'Joe Bloggs')
  fill_in('user_name', with: 'Joey')
  fill_in('email', with: 'joe@joe.com')
  fill_in('password', with: 'password1')
  click_button('submit')
end

def add_peep_test
  click_link('add_peep')
  fill_in('body', with: 'This is a peep')
end