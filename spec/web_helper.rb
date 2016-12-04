def sign_up
  visit('/')
  click_button('Sign up')
end

def user_signs_up
  sign_up
  fill_in 'name', with: 'Kate McCaffrey'
  fill_in 'user_name', with: 'Mac'
  fill_in 'email', with: 'mac@shaper.com'
  fill_in 'password', with: 'netrunner1'
  click_button('Sign me up!')
end
