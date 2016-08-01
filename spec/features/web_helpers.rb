def sign_up(name: "Titus Iudean",
            username: "AppsDJ",
            email: "ty@appsdj.com",
            password: "pass",
            password_confirmation: "pass")
  visit 'users/new'
  fill_in :name, with: name
  fill_in :username, with: username
  fill_in :email, with: email
  fill_in :password, with: password
  fill_in :password_confirmation, with: password_confirmation
  click_button "Sign Up"
end
