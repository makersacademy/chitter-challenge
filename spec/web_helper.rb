def sign_up(email: 'james@baker.com', password: 'squash', password_confirmation: 'squash')
  visit '/users/new'
  expect(page.status_code).to eq (200)
  fill_in :email, with: email
  fill_in :password, with: password
  fill_in :password_confirmation, with: password_confirmation
  click_button 'Sign up'
end
