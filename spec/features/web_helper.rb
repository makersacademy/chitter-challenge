def sign_up
  visit "/users/new"
  fill_in "name", with: "Alice"
  fill_in "user_name", with: "alice"
  fill_in "email", with: "alice@example.com"
  fill_in "password", with: "password1"
  click_button "Create account"
end
