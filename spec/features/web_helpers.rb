def sign_up
  visit '/user/sign_up'
  fill_in('name', with: "Rafi")
  fill_in('user_name', with: "SuperRafi")
  fill_in('email', with: "rafi@superwoman.com" )
  fill_in('password', with: "myPassword123")
  click_button("Sign Up")
end
