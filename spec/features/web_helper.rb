def sign_up
  visit "/"
  click_link "Sign up"
  fill_in "name", with: "Alice"
  fill_in "user_name", with: "alice"
  fill_in "email", with: "alice@example.com"
  fill_in "password", with: "password1"
  click_button "Create account"
end

def log_in
  visit "/"
  click_link "Log in"
  fill_in "email", with: "alice@example.com"
  fill_in "password", with: "password01"
  click_button "Log in"
end
