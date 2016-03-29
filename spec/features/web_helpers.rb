def sign_up_correctly(username: "Bottycrap", email: "paul@paul.com")
  visit '/signup'
  fill_in("name", with: "Paul")
  fill_in("username", with: username)
  fill_in("email", with: email)
  fill_in("password", with: "password")
  fill_in("password_confirmation", with: "password")
  click_button("Register")
end

def sign_up_incorrect_password
  visit '/signup'
  fill_in("name", with: "Paul")
  fill_in("username", with: "Bottycrap")
  fill_in("email", with: "paul@paul.com")
  fill_in("password", with: "password")
  fill_in("password_confirmation", with: "psoword")
  click_button("Register")
end

def sign_up_with_phone
  visit '/signup'
  fill_in("name", with: "Paul")
  fill_in("username", with: "Bottycrap")
  fill_in("email", with: "paul@paul.com")
  fill_in("password", with: "password")
  fill_in("password_confirmation", with: "password")
  fill_in("phone", with: "07709344456")
  click_button("Register")
end

def sign_in_incorrect_password
  visit '/signin'
  fill_in(:username, with: "Bottycrap")
  fill_in(:password, with: "wrongpassword")
  within '#signinform' do
    click_button("Sign In")
  end
end

def sign_in_correctly
  visit '/signin'
  fill_in(:username, with: "Bottycrap")
  fill_in(:password, with: "password")
  within '#signinform' do
    click_button("Sign In")
  end
end

def write_peep
  fill_in(:new_peep, with: "Test peep!")
  click_button("Submit")
end
