def sign_up()
  visit('/users/new')
  expect(page.status_code).to eq(200)
  fill_in :name,      with: 'Kate McCaffrey'
  fill_in :user_name, with: 'Mac'
  fill_in :email,     with: 'mac@shaper.com'
  fill_in :password,  with: 'netrunner1'
  click_button('Sign me up!')
end
