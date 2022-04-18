def sign_up(name: 'test1', email: 'test1@test.com', password: 'password123', confirm_password: 'password123')
  visit '/users/new'
  expect(page.status_code).to eq(200)
  fill_in :name, with: name
  fill_in :email, with: email
  fill_in :password, with: password
  fill_in :confirm_password, with: confirm_password
  click_button 'Sign up'
end

