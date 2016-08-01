def sign_up(email: "aladin@lamp.com", user_name: "Aladin",
                      password: "genie", password_confirmation: "genie")

  visit '/'
  click_button('Sign up')
  fill_in :email, with: email
  fill_in :name, with: user_name
  fill_in :user_name, with: user_name
  fill_in :password, with: password
  fill_in :password_confirmation, with: password_confirmation
  click_button('Sign up')
end

def sign_in(email:, password:)
  visit '/'
  click_button('Sign in')
  fill_in :email, with: email
  fill_in :password, with: password
  click_button('Sign in')
end
