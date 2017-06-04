def make_peep
  visit "/"
  click_button "Make a Peep"
  fill_in "peep", with: "Lorem ipsum dolor sit amet."
  click_button "Release the Peep"
end

def register_user(password = "password")
  visit "/"
  click_button "Register New User"
  fill_in "name", with: "Test"
  fill_in "email", with: "test@fake.com"
  fill_in "password", with: "password"
  fill_in "password_confirmation", with: password
  click_button "register"
end

def sign_in(password = "password")
  click_button "sign in"
  fill_in "email", with: "test@fake.com"
  fill_in "password", with: password
  click_button "sign in"
end
