def log_details
  visit "/"
  fill_in "name", with: "Nicholas Alberto Leacock"
  fill_in "username", with: "Mad Hare"
  fill_in "password", with: "abc"
  fill_in "email", with: "nicholas@swissmail.com"
  click_button "Submit"
end
