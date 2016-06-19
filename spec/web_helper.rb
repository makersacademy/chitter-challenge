def sign_up
  visit 'users/new'
  expect(page.status_code).to eq(200)
  fill_in :email, with: 'anna@example.com'
  fill_in :password, with: 'example'
  click_button 'Sign up'
end
