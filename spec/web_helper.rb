def sign_up
  visit '/sign_up'
  expect(page.status_code).to eq(200)
  fill_in :name, with: 'First User'
  fill_in :username, with: 'number1'
  fill_in :email, with: 'user@email.com'
  # fill_in :password, with: 'terriblepassword1'
  click_button 'Sign up'
end