def sign_in
  visit '/'
  fill_in "username", with: "admin"
  fill_in "password", with: "123"
  click_button "Sign in"
end

def sign_up
  visit '/'
  click_button "Sign Up"
  fill_in "username", with: "admin"
  fill_in "password", with: "123"
  click_button "Sign Up"
end


def add_peep
  visit '/'
  click_button "Sign Up"
  fill_in "username", with: "admin"
  fill_in "password", with: "123"
  click_button "Sign Up"
  fill_in "content", with: "hello world"
  click_button "Add peep"
end
