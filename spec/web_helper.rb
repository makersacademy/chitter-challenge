def sign_up(username: 'DizzyUnicorn', email: 'dizzy@unicorn.com', password: 'rainbow123', password_confirmation: 'rainbow123')
  visit '/users/new'
  expect(page.status_code).to eq 200
  fill_in :username, with: username
  fill_in :email, with: email
  fill_in :password, with: password
  fill_in :password_confirmation, with: password_confirmation
  click_button 'Sign up'
end
