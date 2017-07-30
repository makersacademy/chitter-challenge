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

def sign_up(name, username, email, password, password_confirmation)
  visit '/'
  click_button "Register"
  fill_in "name", with: name
  fill_in "username", with: username
  fill_in "email", with: email
  fill_in "password", with: password
  fill_in "password_confirmation", with: password_confirmation
  click_button "Register"
end

def sign_up_first
    sign_up("Jon Snow", "kingofthenorth", "jon@winterfell.com", "winterishere", "winterishere")
end

def log_in(email, password)
  visit '/'
  click_on "Log in"
  fill_in "email", with: email
  fill_in "password", with: password
  click_button "Log in"
end
