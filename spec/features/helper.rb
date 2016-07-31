def sign_up
  visit '/users/new'
  fill_in 'name', with: 'example'
  fill_in 'username', with: 'example93'
  fill_in 'email', with: 'example@gmail.com'
  fill_in 'password', with: '12345'
  fill_in 'password_confirmation', with: '12345'
  click_button('Sign up')
end
