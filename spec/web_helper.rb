def sign_up
  visit '/sign-up'
  expect(page.status_code).to eq(200)
  fill_in :username, with: 'satoshi'
  fill_in :email, with: 'satoshi@example.com'
  fill_in :password, with: 'oranges!'
  click_button 'Sign up'
end
