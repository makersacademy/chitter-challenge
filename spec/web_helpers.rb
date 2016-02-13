def sign_up(name:                  'Samuel Russell Hampden Joseph',
            username:              'tansaku',
            email:                 'sam@makersacademy.com',
            password:              's3cr3t',
            password_confirmation: 's3cr3t')
  visit '/users/new'
  expect(page.status_code).to eq(200)
  fill_in :name,                  with: name
  fill_in :username,              with: username
  fill_in :email,                 with: email
  fill_in :password,              with: password
  fill_in :password_confirmation, with: password_confirmation
  click_button 'Sign up'
end