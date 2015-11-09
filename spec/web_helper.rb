def sign_up
  visit '/users/new'
  expect(page.status_code).to eq(200)
  fill_in :email,    with: 'test@example.com'
  fill_in :password, with: 'testytesy'
  fill_in :name,    with: 'imatest'
  fill_in :username, with: 'mynameistest'
  click_button 'Sign up'
end
