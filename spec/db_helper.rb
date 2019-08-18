def user_sign_in
  visit('/chitter')
  click_button("Login")
  fill_in("Username:", with: "admin")
  fill_in("Password:", with: "admin")
  click_button("Login")
end
