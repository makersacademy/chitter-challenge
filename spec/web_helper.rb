def sign_up(email: 'test@test.com',
            username: 'tester',
            password: 'test123',
            password_confirmation: 'test123')
  visit '/users/new'
  expect(page.status_code).to eq 200
  fill_in :email, with: email
  fill_in :username, with: username
  fill_in :password, with: password
  fill_in :password_confirmation, with: password_confirmation
  click_button 'Sign Up'
end
