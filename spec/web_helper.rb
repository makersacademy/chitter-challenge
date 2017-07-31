def sign_up
  visit '/users/new'
  expect(page.status_code).to eq(200)
  fill_in :name,     with:  'Bob Builder'
  fill_in :username, with:  '@bobthebuilder'
  fill_in :email,    with:  'bob@example.com'
  fill_in :password, with:  '123abc!'
  click_button 'Sign up'
end
