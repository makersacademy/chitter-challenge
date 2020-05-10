def post_peep_to_chitter
  visit('/chitter')
  fill_in 'peep', with: 'First peep'
  click_button 'Post Peep'
end

def user_sign_up_to_chitter
  visit('/user/sign-up')
  fill_in 'user_name', with: 'User Name'
  fill_in 'user_email', with: 'user-email@email.com'
  fill_in 'user_password', with: 'password'
  click_button 'Sign Up'
end

def user_log_in_to_chitter
  visit('/user/log-in')
  fill_in 'login_user_name', with: 'User Name'
  fill_in 'login_user_email', with: 'user-email@email.com'
  fill_in 'login_password', with: 'password'
  click_button 'Log In'
end