def sign_up(name: 'Louisa Spicer',
   username: 'louisaspicer',
   email: 'louisa@example.com',
   password: 'greatpassword',
   confirm: 'greatpassword')
  visit '/'
  click_button('Sign Up')
  fill_in("name", with: name)
  fill_in("username", with: username)
  fill_in("email", with: email)
  fill_in("password", with: password)
  fill_in("confirm_password", with: confirm)
  click_button('Register')
end

def login(username: 'louisaspicer', password: 'greatpassword')
  visit '/'
  fill_in 'username', with: username
  fill_in 'password', with: password
  click_button('Login')
end
