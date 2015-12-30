def register(name: 'camilla', email: 'camilla@email.com', username: 'allimac', password: 'pass123', password_confirmation: 'pass123')
  visit '/register'
  fill_in("name", with: name)
  fill_in("username", with: username)
  fill_in("email", with: email)
  fill_in("password", with: password)
  fill_in("password_confirmation", with: password_confirmation)
  click_button("Sign up!")
end
