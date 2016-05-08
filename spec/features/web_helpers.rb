def sign_up
  visit '/'
  fill_in 'name', with: 'Macey Baker'
  fill_in 'username', with: 'macebake'
  fill_in 'email', with: 'me@macey.com'
  fill_in 'password', with: 'rspecrulez'
  click_button 'Sign up'
end

def log_in
  visit '/'
  fill_in 'returning_username', with: 'maceyforever'
  fill_in 'returning_password', with: 'capybara'
  click_button 'Log in'
end
