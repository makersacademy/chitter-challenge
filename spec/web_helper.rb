def sign_up(username: 'DizzyUnicorn', email: 'dizzy@unicorn.com', password: 'rainbow123', confirm_password: 'rainbow123')
  visit '/users/new'
  expect(page.status_code).to eq 200
  fill_in :username, with: username
  fill_in :email, with: email
  fill_in :password, with: password
  fill_in :confirm_password, with: confirm_password
  click_button 'Sign up'
end
