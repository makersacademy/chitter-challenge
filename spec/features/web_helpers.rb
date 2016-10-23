
def register
  visit ("/")
  click_button "Register"
  fill_in "first_name", with: "Alan"
  fill_in "last_name", with: "Shearer"
  fill_in "username", with: "alan123"
  fill_in "email", with: "alan@nufc.com"
  fill_in "password", with: "password123"
  fill_in "password_confirmation", with: "password123"
  click_button "Register"
end

def sign_in
  visit '/sessions/sign_in'
  fill_in "email", with: "alan@nufc.com"
  fill_in "password", with: "password123"
  click_button "Sign in"
end

def sign_in_with_incorrect_password
  visit '/sessions/sign_in'
  fill_in "email", with: "alan@nufc.com"
  fill_in "password", with: "password456"
  click_button "Sign in"
end

def sign_in_with_unregistered_email
  visit '/sessions/sign_in'
  fill_in "email", with: "alan@safc.com"
  fill_in "password", with: "password123"
  click_button "Sign in"
end

def create_peep(peep)
  fill_in "peep", with: peep
  click_button "PEEP"
end
