def sign_up
  visit '/users/new'
  expect(page.status_code).to eq(200)
  fill_in :name,     with: 'George Eaton'
  fill_in :username, with: 'Gweaton'
  fill_in :email,    with: 'george@example.com'
  fill_in :password, with: 'george123'
  click_button 'Sign up'
end
