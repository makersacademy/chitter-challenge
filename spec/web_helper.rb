def sign_up
  visit '/users/new'
  expect(page.status_code).to eq(200)
  fill_in :name,    with: 'Joe Bloggs'
  fill_in :username,    with: 'JoeBloggs93'
  fill_in :email,    with: 'test@example.com'
  fill_in :password, with: '12345'
  click_button 'Sign up'
end
