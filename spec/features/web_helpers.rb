def sign_up
  visit '/'
  click_button 'Sign Up'
  fill_in :name, with: 'Chewbacca'
  fill_in :username, with: 'chewbacca'
  fill_in :email, with: 'chewbacca@google.com'
  fill_in :password, with: 'pa$$w0rd'
  click_button 'Sign Up'
end

def duplicate_sign_up_username
  # Rakefile already sets up Han Solo as a user
  visit '/'
  click_button 'Sign Up'
  fill_in :name, with: 'Han Solo'
  fill_in :username, with: 'hansolo'
  fill_in :email, with: 'han_solo@google.com'
  fill_in :password, with: 'pa$$w0rd'
  click_button 'Sign Up'
end

def duplicate_sign_up_email
  # Rakefile already sets up Han Solo as a user
  visit '/'
  click_button 'Sign Up'
  fill_in :name, with: 'Han Solo'
  fill_in :username, with: 'han_solo'
  fill_in :email, with: 'hansolo@gmail.com'
  fill_in :password, with: 'pa$$w0rd'
  click_button 'Sign Up'
end

def log_in
  visit '/'
  click_button 'Log In'
  fill_in :email, with: 'hansolo@gmail.com'
  fill_in :password, with: 'pa$$w0rd1'
  click_button 'Log In'
end

def log_in_incorrect_email
  visit '/'
  click_button 'Log In'
  fill_in :email, with: 'wrong email'
  fill_in :password, with: 'pa$$w0rd1'
  click_button 'Log In'
end

def log_in_incorrect_password
  visit '/'
  click_button 'Log In'
  fill_in :email, with: 'hansolo@gmail.com'
  fill_in :password, with: 'wrong password'
  click_button 'Log In'
end

def post_peep
  fill_in :peep_input, with: 'A test peep!'
  click_button 'Post Peep'
end
