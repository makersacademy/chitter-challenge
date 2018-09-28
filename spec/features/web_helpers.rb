def visit_sign_up_page
  visit '/'
  click_link 'Sign up for Chitter!'
end

def sign_in_as_billy
  visit '/'
  fill_in 'username', with: 'billy1'
  fill_in 'password', with: 'password'
  click_button 'Sign in'
end 
