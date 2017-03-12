def sign_up
  visit '/'
  click_button('Register New User')
  fill_in :full_name,     with: "Noo Userson"
  fill_in :user_name,     with: "Noobie"
  fill_in :email,         with: "new@user.com"
  fill_in :password,      with: "secret_password"
  fill_in :password_confirmation,  with: "secret_password"
  click_button('Sign Up')
end

def log_in(email:, password:)
  visit '/sessions/new'
  fill_in :email, with: email
  fill_in :password, with: password
  click_button('Log In')
end
