def sign_up
  visit '/sign-up'
  expect(page.status_code).to eq 200

  fill_in :email, with: 'izzy@example.com'
  fill_in :password, with: 'password1'
  fill_in :username, with: 'ilarne'
  click_button 'Sign up'
end
