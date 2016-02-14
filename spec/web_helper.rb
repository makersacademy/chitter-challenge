def sign_up(email: 'ric9176@hotmail.com',
  password: 'password',
  name: 'Ric',
  user_name: 'ric9176',
  passwordconf: 'password')

  visit '/users/new'
  expect(page.status_code).to eq(200)
  fill_in :email,    with: email
  fill_in :password, with: password
  fill_in :name, with: name
  fill_in :user_name, with: user_name
  fill_in :passwordconf, with: passwordconf
  click_button 'Sign up'
end
