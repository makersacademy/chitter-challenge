def sign_up
  visit "makers/new"
  fill_in "email", with: "andrea@gmail.com"
  fill_in "password", with: "mypassword"
  fill_in "name", with: "Andrea"
  fill_in "username", with: "Angea89"
  click_button "Submit"
end
