def sign_up(name: 'Louisa Spicer',
   email: 'louisa@example.com',
   username: 'louisaspicer',
   password: 'greatpassword',
   password_confirmation: 'greatpassword')
  visit '/'
  click_button('Sign Up')
  fill_in("name", with: name)
  fill_in("username", with: username)
  fill_in("email", with: email)
  fill_in("password", with: password)
  fill_in("confirm_password", with: password_confirmation)
  click_button('Register')
end

def login(username: 'louisaspicer', password: 'greatpassword')
  visit '/'
  fill_in 'username', with: username
  fill_in 'password', with: password
  click_button('Login')
end
