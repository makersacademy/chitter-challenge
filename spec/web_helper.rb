def sign_up
  visit('/')
  click_button "Sign up"
  fill_in :name, with: "one of makers"
  fill_in :username, with: "cat"
  fill_in :email, with: "cat@email.com"
  fill_in :password, with: "secret"
  click_button "Submit"
end

def log_in
  visit('/')
  click_button "Log in"
  fill_in(:email, with: "cat@email.com")
  fill_in(:password, with: "secret")
  click_button "Submit"
end
