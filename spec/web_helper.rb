def sign_up
  visit '/users/new'
  fill_in 'name', with: 'Dave Mittens'
  fill_in 'username', with: 'Cat_Peeps93'
  fill_in 'email', with: 'dave@gmail.com'
  fill_in 'password', with: '12345'
  fill_in 'password_confirmation', with: '12345'
  click_button 'Sign Up!'
end
