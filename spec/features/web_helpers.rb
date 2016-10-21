def sign_up
  visit '/sign-up'
  fill_in "name", :with => "Malinna Leach"
  fill_in "username", :with => "the_guvnor"
  fill_in "email", :with => "malinnab@yahoo.com"
  fill_in "password", :with => "s3cr3t"
  click_button "Sign Up!"
end
