def create_account
  visit "/"
  click_button("Create Account")
  fill_in("email", with: 'abc@gmail.com')
  fill_in("password", with: "mypass")
  click_button("Sign Up")
end
