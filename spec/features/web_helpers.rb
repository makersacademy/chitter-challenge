def signup_and_login
  visit '/signup'
  fill_in 'name', with: "John Doe"
  fill_in 'username', with: "JDoe123"
  fill_in 'email', with: 'johndoe@gmail.co.uk'
  fill_in 'password', with: "Password123"
  click_button 'Create account'
  fill_in 'email', with: "johndoe@gmail.co.uk"
  fill_in 'password', with: "Password123"
  click_button 'Log in'
end
