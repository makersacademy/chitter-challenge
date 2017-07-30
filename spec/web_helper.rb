def sign_up
  visit '/users/new'
  expect(page.status_code).to eq(200)
  fill_in :email,    with: 'yuliya@example.com'
  fill_in :password, with: 'hitter!'
  click_button 'Sign up'
end
