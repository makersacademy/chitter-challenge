def sign_up

  fill_in("name", with: "Courtney")
  fill_in("user_name", with: "Court01")
  fill_in("email", with: "example@gmail.com")
  fill_in("password", with: "password")
  fill_in("confirm_password", with: "password")
  click_button("Sign Up")

end
