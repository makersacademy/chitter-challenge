def sign_up_details
  visit "/"
  click_button "Sign Up"
  fill_in "name", with: "Nicholas Alberto Leacock"
  fill_in "username", with: "Mad Hare"
  fill_in "password", with: "abc"
  fill_in "email", with: "nicholas@swissmail.com"
  click_button "Submit"
end


def log_in_details
  visit "/"
  click_button "Log In"
  fill_in "username", with: "Mad Hare"
  fill_in "password", with: "abc"
  click_button "Submit"
end
