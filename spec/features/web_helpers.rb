def user_sign_up
  visit '/user/new'
  fill_in "email", with: "me@me.com"
  fill_in "name", with: "Ellie W"
  fill_in "username", with: "winnie"
  fill_in "password", with: "pass2017"
  click_on "Sign up"
end

def add_peep
  visit '/peep/new'
  fill_in "message", with: "If everybody minded their own business, the world would go around a great deal faster than it does."
  click_on "Post peep"
end
