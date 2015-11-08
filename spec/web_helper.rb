def sign_up(name: 'Ezzy Elliott',
            username: 'ezzye',
            email: 'ezzy.elliott@gamil.com',
            password: '123456',
            password_confirmation: '123456'
            )
  visit '/users/new'
  expect(page.status_code).to eq(200)
  fill_in :name, with: name
  fill_in :username, with: username
  fill_in :email, with: email
  fill_in :password, with: password
  fill_in :password_confirmation, with: password_confirmation
  click_button 'Sign up'
end

def sign_in(username: 'ezzye',
            password: '123456')
  visit '/sessions/new'
  expect(page.status_code).to eq(200)
  fill_in :username, with: username
  fill_in :password, with: password
  click_button 'Sign in'
end