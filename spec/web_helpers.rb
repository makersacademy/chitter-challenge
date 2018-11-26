def db_connection
  connection = 'chitter'
  connection = 'chitter_test' if ENV['ENVIRONMENT'] == 'test'
  db = PG.connect(dbname: connection)
end

def setup_database
  db = db_connection
  db.exec('TRUNCATE users;')
end

def sign_up(user_info)
  visit('/')
  click_link('login_signup')
  click_link('create_account')
  fill_in('fname', with: user_info['first_name'])
  fill_in('lname', with: user_info['last_name'])
  fill_in('email', with: user_info['email'])
  fill_in('confirm_email', with: user_info['email'])
  fill_in('pwd', with: user_info['password'])
  fill_in('confirm_pwd', with: user_info['password'])
  click_button('signup')
end

def login(user_info)
  sign_up(user_info)
  visit('/login')
  fill_in('email', with: user_info['email'])
  fill_in('pwd', with: user_info['password'])
  click_button('login')
end

def create_peeps(user_info)
  sign_up(user_info)
  result = db_connection.exec("SELECT id FROM users WHERE email = '#{user_info['email']}';")
  user_id = result[0]['id']
  Peep.create(description: 'one', id: user_id )
  Peep.create(description: 'two', id: user_id )
  Peep.create(description: 'three', id: user_id )
end
