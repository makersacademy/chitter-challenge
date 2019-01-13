def signup_steps
  visit '/'
  click_on 'Sign Up'
  fill_in :name, with: 'test'
  fill_in :username, with: '@test'
  fill_in :email, with: 'test@test.com'
  fill_in :password, with: 'secret123'
  click_button 'Sign Up'
end

def signin_steps
  visit '/'
  click_on 'Sign In'
  fill_in :email, with: 'test@test.com'
  fill_in :password, with: 'secret123'
  click_button 'Sign In'
end