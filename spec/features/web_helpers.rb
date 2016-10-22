
def register
  visit ("/")
  click_button "Register"
  fill_in "first_name", with: "Alan"
  fill_in "last_name", with: "Shearer"
  fill_in "username", with: "alan123"
  fill_in "email", with: "alan@nufc.com"
  fill_in "password", with: "password123"
  fill_in "password_confirmation", with: "password123"
end
