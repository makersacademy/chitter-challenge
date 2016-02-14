def sign_up(name: 'Jeremy',
            username: 'Flight_of_dragons',
            email: 'jeremy@makersacademy.com',
            password: 'password',
            confirm_password: 'password')
  visit '/home'
  click_button 'Sign up'
  fill_in 'name', with: name
  fill_in 'username', with: username
  fill_in 'email', with: email
  fill_in 'password', with: password
  fill_in 'confirm_password', with: confirm_password
  click_button 'Submit details'
end
