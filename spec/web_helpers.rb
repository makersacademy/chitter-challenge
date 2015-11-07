def sign_up
  visit('/')
  click_button('Sign up')
  fill_in('username', with: 'mmm')
  fill_in('password', with: 'ooh')
  fill_in('password_check', with: 'ooh')
  click_button('Submit')
end
