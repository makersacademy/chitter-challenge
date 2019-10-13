def sign_up
  visit '/'
  click_link 'Sign Up'
  fill_in "Chitter Handle", with: "guy"
  fill_in "Name", with: "Guy"
  fill_in "Email", with: "guy@mail.com"
  fill_in "Password", with: "AReallyReallySecurePassword"
  click_button "Sign Up"
end