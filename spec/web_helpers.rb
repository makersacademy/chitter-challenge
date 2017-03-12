def sign_up
  visit '/'
  click_button "Sign up"
  fill_in :first_name, with: "Chandler"
  fill_in :last_name, with: "Bing"
  fill_in :username, with: "Bingaling"
  fill_in :email, with: "funny_man@haha.com"
  fill_in :password, with: "IloveMonica"
  click_button "Sign up"
end

def sign_in
  visit '/'
  click_button "Sign in"
  fill_in :email, with: ("funny_man@haha.com")
  fill_in :password, with: ("IloveMonica")
  click_button "Sign in"
end

def write_a_peep
  click_button "Compose New Peep"
  fill_in :message, with: ("It's sunny today :)")
  click_button "Peep"
end
