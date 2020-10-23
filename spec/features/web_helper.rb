def log_in
  visit("/")
  click_link "Log In"
  fill_in("email", with: "test@test.com")
  fill_in("password", with: "test123")
  click_button "GO"
end

def create_acc 
  visit("/")
  click_link "Sign Up"
  fill_in("name", :with => "Test")
  fill_in("email", with: "test@test.com")
  fill_in("password", with: "test123")
  click_button "Create Account"
end