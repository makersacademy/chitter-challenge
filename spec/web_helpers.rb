def sign_up
  visit '/'
  fill_in "username", with: "Shaun"
  fill_in "password", with: "012345"
  fill_in "password_confirmation", with: "012345"
  click_button "Submit"
end