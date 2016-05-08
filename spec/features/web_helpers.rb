def sign_up
  visit '/'
  click_button 'Sign up'
  fill_in 'name', with: 'Macey Baker'
  fill_in 'username', with: 'macebake'
  fill_in 'email', with: 'me@macey.com'
  fill_in 'password', with: 'rspecrulez'
  click_button 'Sign up'
end

def log_in
  sign_up
  visit '/'
  click_button 'Log in'
  fill_in 'returning_username', with: 'macebake'
  fill_in 'returning_password', with: 'rspecrulez'
  click_button 'Log in'
end
