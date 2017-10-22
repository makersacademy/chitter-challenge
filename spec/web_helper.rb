def sign_up
  visit '/users/new'
  expect(page.status_code).to eq 200
  fill_in :username, with: "Lucas"
  fill_in :email, with: "lucas@lucas.com"
  fill_in :password, with: "password123"
  click_button 'Sign up!'
end
