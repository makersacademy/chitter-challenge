def sign_up
  visit '/users/new'
  expect(page.status_code).to eq(200)
  fill_in :email,    with: 'example@gmail.com'
  fill_in :password, with: 'example'
  fill_in :username, with: 'Exampleton'
  click_button 'Sign up'
end
