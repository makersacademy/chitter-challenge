# Add to this file if there are common set up tasks for Capybara

def visit_sessions_new_and_sign_in (email:, password:)
  visit '/sessions/new'
  fill_in(:email, with: email)
  fill_in(:password, with: password)
  click_button('Sign in')
end