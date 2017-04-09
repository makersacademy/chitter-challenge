def sign_up
  visit '/users/new'
  expect(page.status_code).to eq 200
  fill_in :name, with: 'Jean Tremblay'
  fill_in :username, with: 'jt14'
  fill_in :email, with: 'jean@example.com'
  fill_in :password, with: 'oranges!'
  click_button 'Sign up'
end
