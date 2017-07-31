def sign_up
  visit '/users/new'
  fill_in 'email', with: 'alice@example.com'
  fill_in 'password', with: 'oranges!'
  click_button 'sign up'
end
