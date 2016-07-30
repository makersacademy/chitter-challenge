def signup
  visit "/signup"
  fill_in "email", with: "richard@gmail.com"
  fill_in "password", with: "123"
  fill_in "name", with: "Richard"
  fill_in "username", with: "lord_rich"
  click_button "Sign up"
end
