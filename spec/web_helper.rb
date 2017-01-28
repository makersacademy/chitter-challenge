def sign_up(email: 'franklin.shaw@gmail.com', password: '12345678', password_confirmation: '12345678', name: 'frankie shaw', username: 'frankiefy')
  visit '/'
  expect(page.status_code).to eq(200)
  fill_in :email, with: email
  fill_in :password, with: password
  fill_in :password_confirmation, with: password_confirmation
  fill_in :name, with: name
  fill_in :username, with: username
  click_button 'Sign up'
end
