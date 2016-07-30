def sign_up
  fill_in('username', with: 'acsauk')
  fill_in('email', with: 'a@b.com')
  fill_in('password', with: 'password123')
  fill_in('password_confirmation', with: 'password123')
  find_button('Sign up').click
end
