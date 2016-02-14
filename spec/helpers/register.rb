def register(
             name: 'Tristan',
             username: 'elchapo91',
             email: 'elchapo91@email.com',
             password: '12345',
             password_confirmation: '12345'
             )

  visit '/register'
  fill_in("name", with: name)
  fill_in("username", with: username)
  fill_in("email", with: email)
  fill_in("password", with: password)
  fill_in("password_confirmation", with: password_confirmation)
  click_button("Register")
end
