def sign_up (first_name: "Darth", last_name: "Vader", email: 'darth_vader@gmail.com', username: "Darth Vader")
  visit('/users/new')
  fill_in :first_name, with: first_name
  fill_in :last_name, with: last_name
  fill_in :email, with: email
  fill_in :username, with: username
  fill_in :password, with: "notanakin"
  click_button "Sign Up"
end
