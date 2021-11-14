def signup
  visit ('/')
  click_link "Sign up"
  fill_in :username, with: "Joe Bloggs"
  fill_in :email, with: "joe@gmail.com"
  click_button "Sign up"
end