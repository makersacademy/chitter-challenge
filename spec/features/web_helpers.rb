def sign_up
  visit '/users/new'
  expect(page.status_code).to eq(200)
  fill_in :email, with: 'ben@123.com'
  fill_in :password, with: 'secretword'
  click_button('Sign up')
end
