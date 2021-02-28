def register_people
  visit '/homepage'
  fill_in :register_username, with: 'James'
  fill_in :register_password, with: 'password123'
  click_button 'Register'
end

def login
  fill_in :login_username, with: 'James'
  fill_in :login_password, with: 'password123'
  click_button 'Login'
end

def wrong_login
  fill_in :login_username, with: 'James'
  fill_in :login_password, with: 'wrong'
  click_button 'Login'
end

def demo_peep
  fill_in :peep, with: "This is my fucking peep"
  click_button 'post_peep'
end
