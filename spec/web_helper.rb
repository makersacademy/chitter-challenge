def sign_up
  visit '/users/new'
  expect(page.status_code).to eq(200)
  fill_in :name,                  with: 'Humpty Dumpty'
  fill_in :email,                 with: 'humptydumpty@wall.com'
  fill_in :password,              with: 'egg!'
  fill_in :password_confirmation, with: 'egg!'
  click_button 'Sign up'
end
