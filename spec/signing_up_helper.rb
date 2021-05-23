def register_new_user
  visit('/register')
  fill_in(:first_name, with: 'Bob')
  fill_in(:last_name, with: 'Michael')
  fill_in(:username, with: 'itsbob')
  fill_in(:email, with: 'bob@bob.com')
  fill_in(:password, with: 'password')
  click_button('Sign up')
end