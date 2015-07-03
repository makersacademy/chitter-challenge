def sign_up(user)
  visit '/users/new'
  fill_in :full_name, with: user.full_name
  fill_in :email, with: user.email
  fill_in :username, with: user.username
  fill_in :password, with: user.password
  fill_in :password_confirmation, with: user.password_confirmation
  click_button 'Sign up'
end

def sign_in(user)
  visit '/sign_in'
  fill_in :username, with: user.username
  fill_in :password, with: user.password
  click_button 'Sign in'
end
