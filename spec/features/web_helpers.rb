def sign_up(email: "ed@gmail.com", password: "admin", username: "powderham", name: "Ed")
  visit '/users/new'
  fill_in :email, with: email
  fill_in :password, with: password
  fill_in :username, with: username
  fill_in :name, with: name
  click_button "Submit"
end
