def sign_up
  visit("/")
  click_button("Sign up")
  fill_in("username", with: "Kynosaur")
  fill_in("password", with: "amazing_password")
  fill_in("email", with: "kynosnore@gmail.com")
  fill_in("name", with: "Kye Bracey")
  click_button("Submit")
end

def log_out_and_begin_log_in
  click_button("Log out")
  click_button("Log in")
  fill_in("username", with: "Kynosaur")
end
