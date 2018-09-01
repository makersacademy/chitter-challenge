
def sign_up
  visit('/')
  fill_in('name', with: 'Dave')
  fill_in('email', with: 'dave@dave.com')
  fill_in('password', with: 'pw123')
  fill_in('username', with: 'dave123')
  click_button('Sign up')
end
