def sign_up
  visit '/signup'
  expect(page.status_code).to eq(200)
  fill_in :email,    with: 'eric@example.com'
  fill_in :password, with: 'password'
  click_button 'Sign Up'
end
