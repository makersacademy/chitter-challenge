def sign_up
  visit '/'
  click_button "Sign up"
  fill_in :full_name, with: "Chandler Bing"
  fill_in :username, with: "Bingaling"
  fill_in :email, with: "funny_man@haha.com"
  fill_in :password, with: "IloveMonica"
  click_button "Sign up"
end
