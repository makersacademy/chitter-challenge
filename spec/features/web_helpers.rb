def log_in_test
  visit '/'
  fill_in 'Email', with: "Test987@email.com"
  fill_in 'Password', with: "password987"
  click_button "Log In"
end

# only use once in one of your tests to create the new user, otherwise flash notice will occur
def create_new_user
  visit '/'
  click_link 'Sign Up Here'
  fill_in "email", with: 'Test987@email.com'
  fill_in "password", with: 'password987'
  fill_in "name", with: "Testboy"
  fill_in "handle", with: "Testboy987"
  click_button "Sign Up"
end