def post_peep
  visit "/new_peep"
  fill_in("peep", with: "This is a test peep")
  click_button "Post"
end

def click_sign_up
  visit "/"
  click_button "Sign-up"
end

def sign_up
  click_sign_up
  fill_in("name", with: "Antonio")
  fill_in("username", with: "abc")
  fill_in("email", with: "antonio@makers.com")
  fill_in("password", with: "password")
  fill_in("password_confirmation", with: "password")
  click_button "Sign-up"
end

def sign_up_and_post_peep
  sign_up
  post_peep
end
