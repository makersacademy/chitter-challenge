def sign_up
  visit '/sign_up'
  expect(page.status_code).to eq(200)
  fill_in :name, with: 'alex'
  fill_in :user_name, with: 'somealex'
  fill_in :email, with: 'alex@example.com'
  fill_in :password, with: '1234'
  click_button 'Sign up'
end
