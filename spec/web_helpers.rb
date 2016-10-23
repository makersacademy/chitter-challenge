def sign_up
  fill_in :new_username,      with: 'myusername'
  fill_in :new_email,         with: 'myemail'
  fill_in :new_name,          with: 'myname'
  fill_in :new_password,      with: 'mypassword'
  click_button "Sign up"
end
