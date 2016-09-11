def sign_up(email: 'dennis@themenace.ha', password: 'gnasher',
            password_confirmation: 'gnasher')
  visit '/users/new'
  fill_in('username', with: 'Dennis')
  fill_in('email', with: email)
  fill_in('password', with: password)
  fill_in('password_confirmation', with: password_confirmation)
  click_button 'Sign up'
end
