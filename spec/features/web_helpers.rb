def sign_up
  visit '/'
  click_link 'Sign up'
  fill_in 'enter_name', with: 'Mannie'
  fill_in 'username', with: 'mannieg'
  fill_in 'email', with: 'mannieg@googlemail.com'
  fill_in 'password', with: 'Password123'
  fill_in 'password_confirm', with: 'Password123'
  click_button 'Sign up'
end
