def sign_up
  visit('/users/new')
  fill_in 'first_name', with: "Darth"
  fill_in 'last_name', with: "Vader"
  fill_in 'email', with: "darth_vader@gmail.com"
  fill_in 'username', with: "Darth_Vader"
  fill_in 'password', with: "notanakin"
  click_button "Sign Up"
end
