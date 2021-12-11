def sign_up_test_account
  click_button("Sign up")
  fill_in(:email, with: "test@example.com")
  fill_in(:password, with: "1234")
  fill_in(:username, with: "test")
  click_button("Submit")
end