def logged_on
  User.make(email: "test@email.com", password: "password12345", username: "AbagnaleF", name: "Frank Abagnale")
  visit "/users/sign_in"
  fill_in("username", with: "AbagnaleF")
  fill_in("password", with: "password12345")
  click_button "Sign In"
end

def post_a_peep
  visit "/peeps/new"
  fill_in("peep", with: "This is the post_a_peep test peep")
  click_button "Post"
end

def post_a_peep2
  visit "/peeps/new"
  fill_in("peep", with: "This is the post_a_peep2 test peep")
  click_button "Post"
end
