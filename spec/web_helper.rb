def sign_up
  visit '/users/new'
  expect(page.status_code).to eq(200)
  fill_in :email,    with: 'piet@somewhere.com'
  fill_in :password, with: 'g3he1m'
  fill_in :name,     with: 'Piet Jansen'
  fill_in :username, with: 'pija23'
  click_button 'Sign up'
end
