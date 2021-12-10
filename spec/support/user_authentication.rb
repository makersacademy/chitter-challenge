def sign_up
  visit '/'
  fill_in('username', with: 'Sherwin')
  fill_in('password', with: 'test123')
  click_button('Sign up')
end