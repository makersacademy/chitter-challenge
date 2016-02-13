def sign_up
  visit '/users/new'
  expect(page.status_code).to eq(200)
  fill_in :name,      with: 'Samuel Russell Hampden Joseph'
  fill_in :username,  with: 'tansaku'
  fill_in :email,     with: 'sam@makersacademy.com'
  fill_in :password,  with: 's3cr3t'
  click_button 'Sign up'
end