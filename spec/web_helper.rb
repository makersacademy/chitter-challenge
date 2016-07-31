def sign_up(name: name ='Sarah', password: password = 12, email: email = "sarah@mail.com", password_confirmation: password_confirmation = 12, user_name: user_name="9sarah0")
  visit '/'
  click_button 'Sign up'
  fill_in :name,                  with: name
  fill_in :user_name,             with: user_name
  fill_in :password,              with: password
  fill_in :email,                 with: email
  fill_in :password_confirmation, with: password_confirmation
  click_button "Sign up"
end


def sign_in(email: email = "sarah@mail.com", password:password = 12)
  visit '/'
  click_button 'Sign in'
  fill_in :email,                 with: email
  fill_in :password,              with: password
  click_button 'Sign in'
end
