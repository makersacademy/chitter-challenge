def sign_up
  visit '/users/new'
  expect(page.status_code).to eq(200)
  fill_in :email,    with: 'barry@example.com'
  fill_in :password, with: 'password!'
  fill_in :password_confirmation, with: 'password!'
  click_button 'Sign up'
end
