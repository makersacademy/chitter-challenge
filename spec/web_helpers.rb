def sign_up
  visit 'users/new'
  fill_in :name, with: "Solid Snake"
  fill_in :username, with: "snake"
  fill_in :email, with: "snake@mgs.com"
  fill_in :password, with: "mgs1"
  click_button "Sign up"
end
