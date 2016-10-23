def sign_up
  visit '/login'
  fill_in('email_signup', with: 'bubble@bubbles.com')
  fill_in('name_signup', with: 'Tim')
  fill_in('username_signup', with: 'Bubbles')
  fill_in('password_signup', with: 'password')
  click_button('Sign up')
end

def log_in
  visit '/login'
  fill_in('username_login', with: 'Bubbles')
  fill_in('password_login', with: 'password')
  click_button('Sign in')
end

def peep(message)
  visit "/"
  fill_in("message", with: message)
  click_button "Peep"
end
