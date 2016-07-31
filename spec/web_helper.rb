def sign_up
  visit('/user/sign_up')
  expect(page.status_code).to eq 200
  fill_in(:name, with: 'name')
  fill_in(:username, with: 'user')
  fill_in(:email, with: 'email@example.com')
  fill_in(:password, with: 'password')
  click_button('Sign up')
end
