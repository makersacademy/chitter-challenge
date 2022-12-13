def sign_up

  visit "/"
  fill_in "username", with: "user1@email.com"
  fill_in "password", with: "password1"
  click_button "Submit"

end