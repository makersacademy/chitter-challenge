def sign_up
  visit '/'
  click_button('Sign up')
  fill_in "name", :with => "suse"
  fill_in "username", :with => "sus111"
  fill_in "email", :with => "suse@gmail.com"
  fill_in "password", :with => "monkey"
  fill_in "password_confirmation", :with => "monkey"
  click_button('Sign me up!')
end

def sign_in
  visit '/'
  click_button "Sign in"
  fill_in "email", :with => "suse@gmail.com"
  fill_in "password", :with => "piano"
  click_button "Sign in"
end
