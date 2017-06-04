def sign_up
  visit '/users/new'
  expect(page.status_code).to eq(200)
  fill_in :email,    with: 'alice@example.com'
  fill_in :password, with: 'oranges!'
  click_button 'Sign up'
end
