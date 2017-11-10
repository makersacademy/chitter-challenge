def sign_up
  visit '/users/new'
  expect(page.status_code).to eq(200)
  fill_in :email, with: 'alice@example.com'
  fill_in :first_name, with: 'Alice'
  fill_in :last_name, with: 'Smith'
  fill_in :password, with: '123'

  click_button 'Go Chitter!'
end
