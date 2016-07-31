def sign_up(username: "David", email: "example@example.net", password: "123456789")
  visit '/users/new'
  fill_in username:, with: username
  fill_in :email, with: email
  fill_in :password, with: password
  fill_in :password_confirmation, with: password
  click_button "Sign up"
end
