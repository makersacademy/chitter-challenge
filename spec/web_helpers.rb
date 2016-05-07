def sign_up(name, user_name, email, password, password_confirmation=password)
  visit '/user/new'
  fill_in :name, with: name
  fill_in :user_name, with: user_name
  fill_in :email, with: email
  fill_in :password, with: password
  fill_in :password_confirmation, with: password_confirmation

end
