def sign_up(email: "user@example.com", password: "123456789", password_confirmation: "123456789" )
  visit '/users/new'
  expect(page.status_code).to eq(200)
  fill_in :email,                 with: email
  fill_in :password,              with: password
  fill_in :password_confirmation, with: password_confirmation
  click_button "Sign up"
end

def sign_in(email: 'user@example.com', password: '123456789')
  visit '/sessions/new'
  expect(page.status_code).to eq 200
  fill_in :email, with: email
  fill_in :password, with: password
  click_button "Sign in"
end
