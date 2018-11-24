def db_connection
  connection = 'chitter'
  connection = 'chitter_test' if ENV['ENVIRONMENT'] == 'test'
  db = PG.connect(dbname: connection)
end

def setup_database
  db = db_connection
  db.exec('TRUNCATE users;')
end

def sign_up
  visit('/')
  click_link('login_signup')
  click_link('create_account')
  fill_in('fname', with: 'Abdi')
  fill_in('lname', with: 'Abdi')
  fill_in('email', with: 'abdi@gmail.com')
  fill_in('confirm_email', with: 'abdi@gmail.com')
  fill_in('pwd', with: 'password123')
  fill_in('confirm_pwd', with: 'password123')
  click_button('signup')
end
