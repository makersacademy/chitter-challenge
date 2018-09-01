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
