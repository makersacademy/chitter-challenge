def sign_up (username: 'mat', email: 'mat@makers.com', password: '123abc', password_confirmation: '123abc')
  visit ('/signup')
  fill_in 'username', with: username
  fill_in 'email', with: email
  fill_in 'password', with: password
  fill_in 'password_confirmation', with: password_confirmation
  click_button('Submit')
end
