def sign_up(name: "Mike", username: "Mickey-boy", email: 'mike@mike.com', password: '1234')
  visit '/users/new'
  fill_in 'name', with: name
  fill_in 'username', with: username
  fill_in 'email', with: email
  fill_in 'password', with: password
  click_button 'Sign up'
end
