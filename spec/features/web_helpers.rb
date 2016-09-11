

def sign_up(email: 'dennis@themenace.ha', password: 'gnasher',
            password_confirmation: 'gnasher')
  visit '/users/new'
  fill_in('name', with: 'Dennis The Menace')
  fill_in('username', with: '@DennisDaMennace')
  fill_in('email', with: email)
  fill_in('password', with: password)
  fill_in('password_confirmation', with: password_confirmation)
  click_button 'Sign up'
end

def log_in
  visit '/users/log-in'
  fill_in :email, with: 'dennis@themenace.ha'
  fill_in :password, with: 'gnasher'
  click_button 'Log in'
end
