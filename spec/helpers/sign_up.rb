def sign_up
   visit '/'
  click_link 'Sign Up'
  fill_in "Chitter Handle", with: "the_queen"
  fill_in "Name", with: "The Queen"
  fill_in "Password", with: "AReallyReallySecurePassword"
  click_button "Sign Up"
end