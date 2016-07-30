def sign_up
  visit '/'
  click_button('Sign up')
  fill_in "name", :with => "aga"
  fill_in "username", :with => "awesomeaga"
  fill_in "email", :with => "aga@gmail.com"
  fill_in "password", :with => "monkey"
  fill_in "password_confirmation", :with => "monkey"
  click_button('Sign me up!')
end
