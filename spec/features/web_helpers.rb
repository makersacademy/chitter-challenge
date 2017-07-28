def sign_up
  visit("/")
  click_button("Sign up")
  fill_in("username", with: "Kynosaur")
  fill_in("password", with: "amazing_password")
  fill_in("email", with: "kynosnore@gmail.com")
  fill_in("name", with: "Kye Bracey")
  click_button("Submit")
end

def log_in(username, password)
  click_button("Log in")
  fill_in("username", with: username)
  fill_in("password", with: password)
  click_button("Submit")
end

def post_new_peep(message)
  visit("/new_peep")
  fill_in("message_body", with: message)
  click_button("Submit")
end
