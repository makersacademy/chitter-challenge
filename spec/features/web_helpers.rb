def sign_up
  visit "/"
  fill_in "email", with: "bensheridanedwards@makers.com"
  fill_in "password", with: "password"
  fill_in "name", with: "Ben"
  fill_in "username", with: "BenSE"
  click_button "Sign Up"
end

def sign_in
  visit '/sessions/new'
  fill_in "email", with: "bensheridanedwards@makers.com"
  fill_in "password", with: "password"
  click_button 'Sign In'
end

def post_peep
  visit "/peeps/new"
  fill_in "content", with: "This is my first peep!"
  click_button "Post"
end
