def sign_up
  visit '/users/new'
  fill_in :email, with: "example@email.com"
  fill_in :username, with: "example_username"
  fill_in :name, with: "example_name"
  fill_in :password, with: "password"
  click_button "Sign up"
end
