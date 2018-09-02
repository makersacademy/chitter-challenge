def create_new_peep(body)
  visit("/write_message")
  fill_in "name", with: "Author Name"
  fill_in "username", with: "username"
  fill_in "message", with: body
  click_button "Save"
end

def sign_up
  visit("sign_up")
  fill_in "name", with: "First Last"
  fill_in "username", with: "Username"
  fill_in "email", with: "me@me.com"
  fill_in "password", with: "password"
  click_button "Sign Up"
end
