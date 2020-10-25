def sign_up(username: 'harrypotter', email: 'harrypotter@gmail.com', password: 'password123', password_confirmation: 'password123' )
  visit '/users/signup'
  expect(page.status_code).to eq(200)
  fill_in :username, with: username
  fill_in :email, with: email
  fill_in :password, with: password
  fill_in :password_confirmation, with: password_confirmation
  click_button 'Sign up'
end