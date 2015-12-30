def login(email: 'camilla@email.com', password: 'pass123')
  visit '/login'
  fill_in("email", with: email)
  fill_in("password", with: password)
  click_button("Login")
end
