def sign_up
  visit "/users/new"
  expect(page.status_code).to eq(200)
  fill_in "email", :with => "kenji@gmail.com"
  fill_in "password", :with => "this is Kenji's password"
  click_button "Sign up"
end

def login(email:, password:)
  visit "/sessions/new"
  fill_in :email, with: email
  fill_in :password, with: password
  click_button "Login"
end
