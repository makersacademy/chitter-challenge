def go_to_sign_up
  visit '/chitter'
  click_button "Sign Up to Chitter"
end

def sign_up
  fill_in "email", with: "samantha.ixer@here.com"
  fill_in "password", with: "passwordtest"
  fill_in "first_name", with: "Sam"
  fill_in "surname", with: "Ixer"
  fill_in "username", with: "sami"
  click_button "Sign Up"
end

def go_to_login
  click_button 'See peeps'
  click_button 'Log In'
end

def login(password)
  fill_in "username", with: "sami"
  fill_in "password", with: password
  click_button 'Log In'
end

def sign_up_and_login
  go_to_sign_up
  sign_up
  go_to_login
  login("passwordtest")
end
