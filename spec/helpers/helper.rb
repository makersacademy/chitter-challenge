
def sign_up_as(user)
  visit '/index'
  fill_in :sign_up_name, with: user.name
  fill_in :sign_up_email, with: user.email
  fill_in :sign_up_username, with: user.username
  fill_in :sign_up_password, with: user.password
  click_button 'Sign up'
end




