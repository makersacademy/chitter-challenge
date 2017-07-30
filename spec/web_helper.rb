def sign_up
  visit '/users/new'
  expect(page.status_code).to eq(200)
  fill_in :name,    with: 'Anna'
  fill_in :nickname,    with: 'xx1xx'
  fill_in :email,    with: 'one@example.com'
  fill_in :password, with: '1234'
  click_button 'Sign up'
end
