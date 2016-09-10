def sign_up
  visit '/users/new'
  expect(page.status_code).to eq(200)
  fill_in :email, with: 'awild@gmail.com'
  fill_in :password, with: '1234!'
  click_button 'Sign up'
end
