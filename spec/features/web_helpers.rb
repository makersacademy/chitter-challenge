def sign_up
  visit '/'
  click_button('Sign up')
  fill_in "name", with: "Becca"
  fill_in "username", with: "pregnantwombat"
  fill_in "email", with: "becca@becca.com"
  fill_in "password", with: "haircut"
  fill_in "password_confirmation", with: "haircut"
  click_button('Sign me up!')
end

def sign_in
  visit '/'
  click_button('Sign in')
  fill_in "email", with: "becca@becca.com"
  fill_in "password", with: "haircut"
  click_button('Sign in')
end
