def sign_up
  visit('/users/new')
  expect(page.status_code).to eq(200)
  fill_in('email', with: 'maker@makers.com')
  fill_in('password', with: '000000')
  click_button('Sign up')
end
