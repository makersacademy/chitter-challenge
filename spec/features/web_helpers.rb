def sign_up
  visit '/'
  click_button('Sign up')
  fill_in "name", :with => "suse"
  fill_in "email", :with => "suse@gmail.com"
  fill_in "password", :with => "monkey"
  click_button('Sign me up!')
end
