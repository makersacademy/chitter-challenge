def create_new_peep_one(body)
  sign_up
  visit("/write_message")
  fill_in "message", with: body
  click_button "Save"
end

def create_new_peep_two(body)
  sign_up
  visit("/write_message")
  fill_in "message", with: body
  click_button "Save"
end

def sign_up
  visit("/sign_up")
  fill_in "name", with: "First Last"
  fill_in "username", with: "Username"
  fill_in "email", with: "me@me.com"
  fill_in "password", with: "password"
  click_button "Sign Up"
end

def log_in
  sign_up
  visit("/log_in")
  fill_in "username", with: "Username"
  fill_in "password", with: "password"
  click_button "Log in"
end
