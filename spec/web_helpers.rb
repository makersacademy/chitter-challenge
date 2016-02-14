def sign_up
  visit '/'
  fill_in("name", with: "Ina")
  fill_in("email", with: "ina@test.com")
  fill_in("password", with: 1234)
  fill_in("password_confirmation", with: 1234)
  click_button "Submit"
end