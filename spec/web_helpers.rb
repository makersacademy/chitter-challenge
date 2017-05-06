def sign_up
  visit '/users/signup'
  expect(page.status_code).to eq(200)
  fill_in :username, with: 'jessica123'
  fill_in :email, with: 'jessica@email.com'
  fill_in :password, with: 'jessica'
  click_button 'Sign up'
end
