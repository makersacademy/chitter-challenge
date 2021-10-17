def sign_up
  visit("/home")
  click_button "Sign Up"
  fill_in('firstname', with: 'Tom')
  fill_in('lastname', with: 'Kellett')
  fill_in('username', with: 'a_user')
  fill_in('email', with: 'test_email@email.com')
  fill_in('password', with: 'password123')
  click_button "Submit"
end
