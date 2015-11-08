def sign_up
  visit '/users/new'
  expect(page.status_code).to eq(200)
  fill_in :full_name, with: 'Incredible Yev'
  fill_in :email, with: 'incredible@yev.com'
  fill_in :password, with: 'bla-bla-bla'
  click_button('Sign up')
end