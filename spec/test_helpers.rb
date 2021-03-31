require "pg"

# user registration

def register_test_user
  visit '/users/new'
  fill_in('email', with: 'test@example.com')
  fill_in('password', with: 'password123')
  click_button('Register')
end

# user authentication

def create_test_user
  User.create(email: 'test@example.com', password: 'password123')
end

def sign_in_as_test_user
  visit '/sessions/new'
  fill_in(:email, with: 'test@example.com')
  fill_in(:password, with: 'password123')
  click_button('Log in')
end

def sign_in_with_different_email
  visit '/sessions/new'
  fill_in(:email, with: 'nottherightemail@me.com')
  fill_in(:password, with: 'password123')
  click_button('Log in')
end

def sign_in_with_different_password
  visit '/sessions/new'
  fill_in(:email, with: 'test@example.com')
  fill_in(:password, with: 'wrongpassword')
  click_button('Log in')
end

def log_out
  click_button('Log out')
end

# database

def persisted_data(id:, table:)
  connection = PG.connect(dbname: 'message_manager_test')
  connection.query("SELECT * FROM #{table} WHERE id = '#{id}';")
end