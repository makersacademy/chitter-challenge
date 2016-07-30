def sign_up
  visit '/signup'
  fill_in 'email', with: 'jonny@email.com'
  fill_in 'password', with: 'somepassword'
  # COME BACK AND IMPLEMENT THIS LATER:
  #fill_in 'password_confirmation', with: 'somepassword'
  click_button 'Sign up to Chitter'
end
