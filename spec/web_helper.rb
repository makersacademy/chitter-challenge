def sign_up
  visit '/users/new'
  expect(page.status_code).to eq(200)
  fill_in :email,    with: 'ric9176@hotmail.com'
  fill_in :password, with: 'password'
  fill_in :name, with: 'Ric'
  fill_in :user_name, with: 'ric9176'
  click_button 'Sign up'
end
