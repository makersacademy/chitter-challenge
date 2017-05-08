def sign_up
  visit '/sign-up'
  expect(page.status_code).to eq(200)
  fill_in :email, with: 'alice@lebonbon.com'
  fill_in :name, with: 'Alice LeBon'
  fill_in :user_name, with: 'AliceLB87'
  fill_in :password, with: 'SoTastey'
  click_button('Sign up')
end
