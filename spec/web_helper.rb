def sign_up(email: 'sam@makersacademy.com', password: 's3cr3t', password_confirmation: 's3cr3t', user: 'Samuel Russell Hamden Joseph', username: 'tansaku')
  visit '/users/new'
  expect(page.status_code).to eq(200)
  fill_in :email,    with: email
  fill_in :password, with: password
  fill_in :user, with: user
  fill_in :username, with: username
  fill_in :password_confirmation, with: password_confirmation
  click_button 'Sign up'
end
