def sign_up name, user_name, email, password, password_confirmation=password
  visit '/user/new'
  fill_in :name, with: name
  fill_in :user_name, with: user_name
  fill_in :email, with: email
  fill_in :password, with: password
  fill_in :password_confirmation, with: password_confirmation
end

def sign_in_sign_out name, user_name, email, password
  sign_up name, user_name, email, password
  click_button "Sign up"
  click_button "Sign out"
end
