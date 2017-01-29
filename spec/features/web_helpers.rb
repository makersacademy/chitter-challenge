def signup(email: 'test@example.com', password_confirmation: 'secret')
  visit('/user/new')
  fill_in 'email', with: email
  fill_in 'password', with: 'secret'
  fill_in 'password_confirmation', with: password_confirmation
  fill_in 'name', with: 'John Doe'
  fill_in 'username', with: 'jonodoe'
  click_button 'Sign up'
end
