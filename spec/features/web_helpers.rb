require './app/models/user'

def signup
  visit "/signup"
  fill_in "email", with: "richard@gmail.com"
  fill_in "password", with: "123"
  fill_in "name", with: "Richard"
  fill_in "username", with: "lord_rich"
  click_button "Sign up"
end

def create_log_in
  user = User.create(email: "hulk@gmail.com", password: "smash", name: "hulk", username: "hulk123")
  visit "/login"
  fill_in "email", with: "hulk@gmail.com"
  fill_in "password", with: "smash"
  click_button "Login"
end
