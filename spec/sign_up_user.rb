def sign_up_user
  visit('/chitter')
  click_button 'sign-up'

  fill_in 'email', with: 'example@email.com'
  fill_in 'password', with: 'password123'
  click_button 'submit'
end
