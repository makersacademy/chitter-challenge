def sign_up
  visit '/users/new'
  expect(page.status_code).to eq(200)
  fill_in :email,    with: 'steve@jobs.com'
  fill_in :password, with: 'password'
  fill_in :name, with: 'Stephen'
  fill_in :user_name, with: 'Stephen'
  click_button 'Sign up'
end