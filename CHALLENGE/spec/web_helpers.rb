def sign_up
  visit '/homepage'
  click_button 'Sign up'
  fill_in('Username'   with: 'username')
  fill_in('E-mail',    with: 'e-mail@e-mail.com')
  fill_in('Password',  with: 'password')
  click_button 'Register'
end
