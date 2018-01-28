def sign_up
  visit '/users/new'
  expect(page.status_code).to eq(200)
  fill_in :email,    with: 'someone@emailaddress.com'
  fill_in :password, with: 'password'
  fill_in :name,     with: 'Name'
  fill_in :username, with: 'username123'
  click_button 'Register'
end
