def sign_up
  visit '/'
  fill_in('username', with: 'John')
  fill_in('password', with: 'password123')
  click_button "Sign Up"
end

def sign_up_and_peep
  sign_up
  fill_in('peep_body', with: 'Hello World')
  click_button "post-peep"
end

def log_in
  fill_in('username', with: 'John')
  fill_in('password', with: 'password123')
  click_button "Log In"
end

def peep_again
  fill_in('peep_body', with: 'Hello Again')
  click_button "post-peep"
end
