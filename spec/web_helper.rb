def sign_up
  visit '/users/new'
  expect(page.status_code).to eq(200)
  fill_in :name, with: 'Marley'
  fill_in :username, with: 'Luni'
  fill_in :email, with: 'marley@cat.com'
  fill_in :password, with: 'dreamies'
  click_button 'Sign up'
end
