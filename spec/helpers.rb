def sign_up(email: 'someone@emailaddress.com',
            password: 'password',
            password_confirmation: 'password',
            name: 'Name',
            username: 'username123')
  visit '/users/new'
  expect(page.status_code).to eq(200)
  fill_in :email,                 with: email
  fill_in :password,              with: password
  fill_in :password_confirmation, with: password_confirmation
  fill_in :name,                  with: name
  fill_in :username,              with: username
  click_button 'Register'
end
