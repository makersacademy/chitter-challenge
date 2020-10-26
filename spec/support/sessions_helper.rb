def register
  visit "/users/new"
  fill_in "username", with: "ds.danielh"
  fill_in "email", with: "dan@gmail.com"
  fill_in "full_name", with: "Dan Holmes"
  fill_in "password", with: "hunter2"
  click_button "Submit"
end

def sign_out
  visit "/"
  click_on "Log out?"
end
