
def signup
  visit '/users/signup'
  fill_in(:username, with: 'Mr_X')
  fill_in(:email, with: 'mrx@email.co.uk')
  fill_in(:password, with: 'password')
  fill_in(:password_confirmation, with: 'password')
  click_button('Submit')
end
