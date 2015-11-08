def sign_up
  visit ('/')
  fill_in('username', with: 'Dave')
  fill_in('email', with: 'dave@gmail.com')
  fill_in('password', with: '1234')
  # fill_in('password_confirmation', with: '1234')
  click_button 'Sign up'
end
