def sign_up
  visit '/users/new'
  expect(page.status_code).to eq 200
  fill_in :email, with: 'test@test.com'
  fill_in :username, with: 'tester'
  # fill_in :password, with: 'test123'
  click_button 'Sign Up'
end
