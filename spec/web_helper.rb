def sign_up
  visit '/users/sign_up'
  expect(page.status_code).to eq(200)
  fill_in :username, with: 'sitypop'
  fill_in :name,     with: 'Sity Shah'
  fill_in :email,    with: 'sity@ilikefalafel.com'
  fill_in :password, with: 'secret'
  click_button 'Sign up'
end
