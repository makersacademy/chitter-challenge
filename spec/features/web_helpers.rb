def sign_up
  visit "makers/new"
  fill_in "email", with: "andrea@gmail.com"
  fill_in "password", with: "mypassword"
  fill_in "name", with: "Andrea"
  fill_in "username", with: "Angea89"
  click_button "Submit"
end

def sign_in
  visit '/sessions/new'
  fill_in "email", with: "andrea@gmail.com"
  fill_in "password", with: "mypassword"
  click_button 'Sign in'
end

def post_peep
  visit "/peeps/new"
  fill_in "content", with: "First peep"
  click_button "Post"
end
