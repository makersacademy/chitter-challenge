def sign_up(name: 'Ivan Sathianathan', username: 'ivan', email: 'ivan@test.com', password: '12345', password_confirmation: '12345')
  visit ('/users/new')
  expect(page.status_code).to eq 200
  fill_in :name, with: name
  fill_in :username, with: username
  fill_in :email, with: email
  fill_in :password, with: password
  fill_in :password_confirmation, with: password_confirmation
  click_button 'Submit'
end

def sign_in(username:, password:)
  visit '/sessions/new'
  fill_in 'username', with: username
  fill_in 'password', with: password
  click_button 'Sign in'
end
