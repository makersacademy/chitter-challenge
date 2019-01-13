def signup
  visit '/'
  click_on 'Sign up'
  fill_in :email, with: 'test@test.com'
  fill_in :password, with: 'secret123'
  fill_in :username, with: 'Test'
  click_button 'Sign up'
end

def signin
  visit '/'
  click_on 'Sign in'
  fill_in :email, with: 'test@test.com'
  fill_in :password, with: 'secret123'
  click_button 'Sign in'
end

def submit_peep
  signin
  fill_in :peep, with: 'My first test peep!'
end
