def sign_up
  visit '/users/new'
  expect(page.status_code).to eq 200
  fill_in :email, with: 'test@tester.com'
  fill_in :password, with: 'testpassword'
  click_button 'Sign up'
end
