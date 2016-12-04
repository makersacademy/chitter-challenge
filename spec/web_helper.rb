def sign_up(email: 'bryonywatson1@googlemail.com', password: 'lemons', name: 'Bryony Watson', username: 'bryorama', password_confirmation: 'lemons')
  visit '/users/new'
  expect(page.status_code).to eq(200)
  fill_in :email, with: email
  fill_in :password, with: password
  fill_in :name, with: name
  fill_in :username, with: username
  fill_in :password_confirmation, with: password_confirmation
  click_button 'Sign up'
end
