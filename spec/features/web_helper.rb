def sign_up
  visit '/users/new'
  expect(page.status_code).to eq(200)
  fill_in :email,    with: 'freddie@makersacademy.com'
  fill_in :username,    with: 'FreddieCodes'
  fill_in :password, with: 'oranges!'
  click_button 'Register'
end
