def log_in
  visit("/user/login")
  fill_in("email", with: "test@test.com")
  fill_in("password", with: "test123")
  click_button "GO"
end

def create_acc 
  visit("/user/sign_up")
  fill_in("name", :with => "Test")
  fill_in("email", with: "test@test.com")
  fill_in("password", with: "test123")
  click_button "Create Account"
end