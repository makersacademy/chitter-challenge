def sign_up(email: 'test@test.org.uk', password: 'passyword', password_confirm: 'passyword', username: 'tester', first_name: 'Tester', last_name: 'MacTesterford')
  visit '/sign_up'
  fill_in 'email', with: email
  fill_in 'password', with: password
  fill_in 'password_confirm', with: password_confirm
  fill_in 'username', with: username
  fill_in 'first_name', with: first_name
  fill_in 'last_name', with: last_name
  click_button 'Sign up!'
end
