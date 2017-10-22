def sign_up
  visit '/users/new'
  expect(page.status_code).to eq(200)
  fill_in :email, with: 'boop@boopmail.com'
  fill_in :password, with: 'Password1066'
  click_button "Sign up"
end
