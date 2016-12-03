def sign_up
  visit '/sign_up'
  fill_in :email, with: email
  fill_in :password, with: password
  fill_in :password_confirm, with: password_confirm
  fill_in :name, with: name
  fill_in :handle, with: handle
  click_button 'Sign Up'
end
