def sign_up_generic_user
  visit('/')
  fill_in "name", with: "Firstname Lastname"
  fill_in "username", with: "username"
  fill_in "email", with: "email@email.com"
  fill_in "password", with: "password"
  click_button "Sign Up"
end

def sign_up_generic_user_2
  visit('/')
  fill_in "name", with: "Firstname2 Lastname2"
  fill_in "username", with: "username2"
  fill_in "email", with: "email2@email2.com"
  fill_in "password", with: "password2"
  click_button "Sign Up"
end
