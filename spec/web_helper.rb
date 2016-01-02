def sign_up
  visit '/signup'
  expect(page.status_code).to eq(200)
  fill_in :username,    with: 'foobar'
  fill_in :email,    with: 'foobar@example.com'
  fill_in :name,    with: 'foo bar'
  fill_in :password, with: 'password'
  click_button 'Sign up'
end
