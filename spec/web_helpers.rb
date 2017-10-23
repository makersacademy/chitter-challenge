def sign_up
  visit '/users/new'
  expect(page.status_code).to eq(200)
  fill_in :email,    with: 'sample@example.com'
  fill_in :password, with: 'password123'
  click_button 'Sign up'
end
