def sign_up
  visit '/users/new'
  expect(page.status_code).to eq(200)
  fill_in :email,    with: 'an@example.com'
  fill_in :password, with: 'pass'
  click_button 'Sign up'
end
