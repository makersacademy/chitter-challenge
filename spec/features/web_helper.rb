def log_in
  visit("/user/login")
  fill_in("email", with: "test@test.com")
  fill_in("password", with: "test123")
  click_button "GO"
end