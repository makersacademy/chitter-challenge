def sign_up
  visit("/")
  click_button("Sign up")
  fill_in("username", with: "Kynosaur")
  fill_in("password", with: "amazing_password")
  click_button("Submit")
end
