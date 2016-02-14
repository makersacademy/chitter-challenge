def sign_up
  visit '/home'
  click_button('Sign up')
  fill_in('name', with: 'David')
  fill_in('username', with: 'drjparry')
  fill_in('email', with: 'parry@gmail.com')
  fill_in('password', with: 'password')
  fill_in('password_confirmation', with: 'password')
  click_button("Submit")
end