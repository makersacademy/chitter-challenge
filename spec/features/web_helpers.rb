def login_user(email, password)
  fill_in('email', with: email)
  fill_in('password', with: password)
  click_button('Login')
end
