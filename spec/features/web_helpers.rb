# Add to this file if there are common set up tasks for Capybara

def visit_sessions_new_and_sign_in (email:, password:)
  visit '/sessions/new'
  fill_in(:email, with: email)
  fill_in(:password, with: password)
  click_button('Log on')
end

def new_user_sign_up 
  visit '/'
  click_button 'Sign Up'
  fill_in('email', with: 'test@example.com')
  fill_in('password', with: 'password123')
  fill_in('name', with: 'Test Name')
  fill_in('user_name', with: 'testusername')
  click_button('Sign Up!')
end
