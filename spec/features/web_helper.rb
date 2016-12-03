def sign_up(username: 'louisaspicer',
   email: 'louisa@example.com',
   password: 'greatpassword',
   confirm: 'greatpassword')
  visit '/'
  fill_in("username", with: username)
  fill_in("email", with: email)
  fill_in("password", with: password)
  fill_in("confirm_password", with: confirm)
  click_button('Register')
end
