def register(name)
  visit '/'
  click_button 'Register'
  expect(page.status_code).to eq 200
  expect(page).to have_current_path '/users/new', only_path: true
  fill_in :name, with: name
  fill_in :handle, with: 'Johnny_Boy'
  fill_in :email, with: 'johnny@jimbob.com'
  fill_in :password, with: '1234'
  fill_in :password_confirmation, with: '1234'
  click_button 'Sign up!'
  expect(page.status_code).to eq 200
  expect(page).to have_current_path '/users', only_path: true
end
