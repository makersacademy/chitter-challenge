def clean_test_database
  @conn = PG.connect(dbname: 'chitter_test')
  @conn.exec("TRUNCATE peeps, users;")
end

def create_first_peep
  visit('/')
  click_button('Add Peep')
  fill_in 'new_chitter_message', with: 'just writing some peeps...'
  click_button('Create Peep')
end

def create_test_account
  visit('/user/signup')
  fill_in 'username', with: 'test_user'
  fill_in 'password', with: 'password1234'
  click_button('Sign up!')
end

def create_dummy_user
  user = User.create(username: "tester", password: "password1234")
end

def find_real_user_id
  @conn = PG.connect(dbname: 'chitter_test')
  result = @conn.exec("select min(id) as min_id from users;")
  return result[0]["min_id"]
end
