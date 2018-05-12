def register
  visit '/users/new'
  fill_in "username", with: "georgeyporgey"
  fill_in "email", with: "george@gmail.com"
  fill_in "password", with: "123@PorgeyG"
  fill_in "conf_password", with: "123@PorgeyG"
  click_button "Register"
end
