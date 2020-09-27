
def clear_table(database = "peep_manager_test")
  connection = PG.connect(dbname: database)
  connection.exec("TRUNCATE TABLE users")
  connection.exec("TRUNCATE TABLE peeps")
end

def sign_in
  visit '/'
  click_button 'Sign Up'
  fill_in :email, with: 'ollie@gmail.com'
  fill_in :password, with: 'password123'
  click_button 'Sign Up'
  click_button 'Sign In'
  fill_in :email, with: 'ollie@gmail.com'
  fill_in :password, with: 'password123'
  click_button 'Sign In'
end