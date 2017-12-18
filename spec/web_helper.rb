def sign_up
  visit('/users')
  expect(page.status_code).to eq(200)
  fill_in :email, with: 'jimmy_the_dude@cool.com'
  fill_in :password, with: 'password'
  click_button('Register')
end
