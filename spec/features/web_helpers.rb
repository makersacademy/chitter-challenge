def log_in_test
  visit '/'
  fill_in 'Email', with: "Test987@email.com"
  fill_in 'Password', with: "password987"
  click_button "Log In"
end

def create_new_user
  visit '/'
  click_link 'Sign Up Here'
  fill_in "email", with: 'Test987@email.com'
  fill_in "password", with: 'password987'
  fill_in "name", with: "Testboy"
  fill_in "handle", with: "Testboy987"
  click_button "Sign Up"
end

def delete_db_rows
  conn = PG.connect( dbname: 'chitter_test' )
  conn.exec( "TRUNCATE TABLE users CASCADE" )
  conn.exec( "TRUNCATE TABLE peeps CASCADE" )
  conn.exec( "TRUNCATE TABLE userspeeps CASCADE" )
end