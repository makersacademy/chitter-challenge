def post_a_peep(test_peep)
peep = test_peep
visit '/peeps/new'
fill_in :message, with: peep
click_button 'Post'
end

def test_peep_one
  "Joffrey...Cersei...Walder Frey...Meryn Trant...Tywin Lannister...The Red Woman...Beric Dondarrion...Thoros of Myr...Illyn Payne...The Mountain.."
end

def test_peep_two
  "No need to seize the last word, Lord Baelish. I'll assume it was something clever"
end

def sign_up
  visit '/'
  click_button "Register"
  fill_in "name", with: "Jon Snow"
  fill_in "username", with: "kingofthenorth"
  fill_in "email", with: "jon@winterfell.com"
  fill_in "password", with: "winterishere"
  fill_in "password_confirmation", with: "winterishere"
  click_button "Register"
end

def sign_up_duplicate_username
  sign_up
  visit '/'
  click_button "Register"
  fill_in "name", with: "Ramsay Bolton"
  fill_in "username", with: "kingofthenorth"
  fill_in "email", with: "ramsay@mwhaha.com"
  fill_in "password", with: "reek!reek!"
  fill_in "password_confirmation", with: "reek!reek!"
  click_button "Register"
end

def sign_up_duplicate_email
  sign_up
  visit '/'
  click_button "Register"
  fill_in "name", with: "Hodor"
  fill_in "username", with: "hodorhodorhodor"
  fill_in "email", with: "jon@winterfell.com"
  fill_in "password", with: "hodorhodor!"
  fill_in "password_confirmation", with: "hodorhodor!"
  click_button "Register"
end
