def sign_in
  user
  visit '/'
  fill_in 'login_email_address', with: 'test@test.com'
  fill_in 'login_password', with: 'password123'
  click_button 'login'
end

def bad_email_sign_in
  user
  visit '/'
  fill_in 'login_email_address', with: 'test12@test.com'
  fill_in 'login_password', with: 'password123'
  click_button 'login'
end

def register
  visit '/'
  fill_in('name', with: 'test')
  fill_in('email_address', with: 'test@test.com')
  fill_in('password', with: 'password123')
  click_button 'Sign-up'
end