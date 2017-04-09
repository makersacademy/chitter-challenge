def sign_up (first_name: "Darth",
             last_name: "Vader",
             email: 'darth_vader@gmail.com',
             username: "Darth_Vader",
             password: "notanakin",
             password_confirmation: "notanakin")
  visit('/users/new')
  fill_in :first_name, with: first_name
  fill_in :last_name, with: last_name
  fill_in :email, with: email
  fill_in :username, with: username
  fill_in :password, with: password
  fill_in :password_confirmation, with: password_confirmation
  click_button "Sign Up"
end

def log_in (username: "Darth_Vader", password: "notanakin")
  visit('/sessions/new')
  fill_in :username, with: username
  fill_in :password, with: password
  click_button "Log In"
end
