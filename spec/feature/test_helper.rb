
def sign_up
  visit '/'
  click_button 'Join Chitter today'
  fill_in 'username', with: 'Panda'
  fill_in 'password', with: 'password123'
  fill_in 'confirm_password', with: 'password123'
  fill_in 'name', with: 'Panda'
  fill_in 'email', with: 'panda@gmail.com'
  click_on 'Sign Up'
end

def log_in
  visit '/'
  fill_in 'email', with: 'panda@gmail.com'
  fill_in 'password', with: 'password123'
  click_on 'Log In'
end