def signup_steps
  visit '/'
  click_button "Sign up"
  fill_in :name, with: "Thomas"
  fill_in :username, with: "Thomas974"
  fill_in :email, with: "Thomas@test.com"
  fill_in :password, with: "123"
  click_button 'Sign up'
end

def signin_steps
  fill_in :email, with: "Thomas@test.com"
  fill_in :password, with: "123"
  click_button "Sign in"
end
