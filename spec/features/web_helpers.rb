def login_user
  # Create a test user
  Signup.create(username: "admin", name: "Admin", lastname: "Admin", email: "admin@admin.com", password: "admin")
  # Then sign in as them
  visit "/login"
  fill_in(:email, with: "admin@admin.com")
  fill_in(:password, with: "admin")
  click_button("Enter")
end

def wrong_user
  # Then sign in as them
  visit "/login"
  fill_in(:email, with: "wrong@admin.com")
  fill_in(:password, with: "wrongadmin")
  click_button("Enter")
end
