def sign_up(name: 'alex', user_name: 'somealex', email: 'alex@example.com', password: '1234', password_confirmation: '1234')
  visit '/sign_up'
  expect(page.status_code).to eq(200)
  fill_in :name, with: name
  fill_in :user_name, with: user_name
  fill_in :email, with: email
  fill_in :password, with: password
  fill_in :password_confirmation, with: password_confirmation
  click_button 'Sign up'
end
