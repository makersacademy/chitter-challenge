def sign_up(username: 'James',
            password: 'squash')
  visit '/users/new'
  expect(page.status_code).to eq (200)
  fill_in :username, with: 'James'
  fill_in :password, with: 'squash'
  click_button 'Sign up'
end
