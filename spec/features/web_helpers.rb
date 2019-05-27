def sign_up
  visit('/')
  click_button 'Sign up'
  fill_in('name', with: 'Lucy Barber')
  fill_in('username', with: 'lbarber729')
  fill_in('email', with: 'lucy@email.com')
  fill_in('password', with: 'Password123')
  click_button('Sign up')
end
