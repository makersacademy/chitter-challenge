# web_helpers.rb

def sign_up
  visit('/')
  click_button('Sign up')
  fill_in('name', with: 'Dave')
  fill_in('email', with: 'dave@dave.com')
  fill_in('password', with: 'pw123')
  fill_in('username', with: 'dave123')
  click_button('Sign up')
end

def sign_up_with_another_unique_email
  visit '/'
  click_button('Sign up')
  fill_in('name', with: 'Dave')
  fill_in('email', with: 'dave12@dave.com')
  fill_in('password', with: 'pw123')
  fill_in('username', with: 'dave123')
  click_button('Sign up')
end

def sign_up_with_another_unique_username
  visit '/'
  click_button('Sign up')
  fill_in('name', with: 'Dave')
  fill_in('email', with: 'dave@dave.com')
  fill_in('password', with: 'pw123')
  fill_in('username', with: 'dave1234')
  click_button('Sign up')
end

def log_in
  click_button('Log in')
  fill_in('email', with: 'dave@dave.com')
  fill_in('password', with: 'pw123')
  click_button('Log in')
end
