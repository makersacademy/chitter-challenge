def sign_up
  fill_in "username", with: "Someone233"
  fill_in "password", with: "abcd1234"
  fill_in "email", with: "someone233@hotmail.com"
  fill_in "forename", with: "Someone"
  fill_in "surname", with: "Somebody"
  click_button "Submit"
end
