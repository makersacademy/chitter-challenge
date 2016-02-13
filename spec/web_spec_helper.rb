def sign_up(email: 'jeremy@makersacademy.com',
  password: 'password')
  visit '/home'
  click_button 'Sign up'
  fill_in 'email', with: email
  fill_in 'password', with: password
  click_button 'Submit details'
end
