def sign_up
  visit '/users/new'
  expect(page.status_code).to eq(200)
  fill_in :name,    with: 'Dave'
  fill_in :email,    with: 'example@email.com'
  fill_in :password, with: 'secret'
  click_button 'Sign up'
end
