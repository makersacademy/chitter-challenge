def sign_up
  fill_in "email", with: "samantha.ixer@here.com"
  fill_in "password", with: "passwordtest"
  fill_in "first_name", with: "Sam"
  fill_in "surname", with: "Ixer"
  fill_in "username", with: "sami"
  click_button "Sign Up"
end
