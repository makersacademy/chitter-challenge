def sign_up
  click_link('Sign up')
  fill_in('email', with: 'yourname@example.com')
  fill_in('password', with: 'password123')
  fill_in('name', with: 'John Doe')
  fill_in('username', with: 'jdoe1982')
  click_button('Sign up')
end
