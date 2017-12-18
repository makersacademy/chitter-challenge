def sign_up
  visit '/users/new'
  expect(page.status_code).to eq(200)
  fill_in :email, with: 'example@gmail.com'
  fill_in :password, with: 'oranges!'
  fill_in :name, with: 'ExampleName'
  fill_in :username, with: 'user1234'
  click_button 'Sign Up'
end
