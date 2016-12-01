def sign_up
  visit '/users/new'
  expect(page.status_code).to eq(200)
  fill_in :name, with: 'John Smith'
  fill_in :email, with: 'jsmith@gmail.com'
  fill_in :username, with: 'jsmith2016'
  fill_in :password, with: 'pizza123!'
  click_button 'Sign up'
end
