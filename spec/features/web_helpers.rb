def post_peep
  visit "/new_peep"
  fill_in("peep", with: "This is a test peep")
  click_button "Post"
end

def click_sign_up
  visit "/"
  click_button "Sign-up"
end
