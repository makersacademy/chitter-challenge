def signup
  visit '/signup'
  fill_in 'email', with: 'fake@fake.com'
  fill_in 'password', with: 'password'
  click_button 'submit'
end

def login
  visit '/'
  fill_in 'email', with: 'fake1@fake.com'
  fill_in 'password', with: 'password'
  click_button 'login'
end

def peep
  click_button 'peep'
  fill_in 'content', with: 'Today is great'
  click_button 'submit'
end
