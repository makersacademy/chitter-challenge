def sign_up(username = 'Cat_Peeps93', email = 'dave@gmail.com')
  visit '/users/new'
  fill_in 'name', with: 'Dave Mittens'
  fill_in 'username', with: username
  fill_in 'email', with: email
  fill_in 'password', with: '12345'
  fill_in 'password_confirmation', with: '12345'
  click_button 'Sign Up!'
end
