def sign_up
  visit '/users/new'
  expect(page.status_code).to eq(200)
  fill_in :email,    with: 'bob@bob.com'
  fill_in :password, with: 'bob123'
  fill_in :password_confirmation, with: 'bob123'
  click_button 'Create'
end
