def sign_up
  visit '/sign-up'
  fill_in "name", :with => "Malinna Leach"
  fill_in "username", :with => "the_ceo"
  fill_in "email", :with => "ceo@chitter.com"
  fill_in "password", :with => "s3cr3t"
  click_button "Sign Up!"
end

def sign_up_diff_email
  visit '/sign-up'
  fill_in "name", :with => "Malinna Leach"
  fill_in "username", :with => "the_ceo"
  fill_in "email", :with => "coo@chitter.com"
  fill_in "password", :with => "s3cr3t"
  click_button "Sign Up!"
end

def create_user
  User.new_user_create("Malinna Leach", "the_ceo", "ceo@chitter.com", "s3cr3t")
end

def sign_in
  visit '/login'
  fill_in "username", :with => "the_ceo"
  fill_in "password", :with => "s3cr3t"
  click_button "Log In!"
end

def sign_in_wrong_psswrd
  visit '/login'
  fill_in "username", :with => "the_ceo"
  fill_in "password", :with => "different"
  click_button "Log In!"
end

def sign_out
  click_button "Log Out!"
end

def log_back_in
  click_button "Log In!"
  fill_in "username", :with => "the_ceo"
  fill_in "password", :with => "s3cr3t"
  click_button "Log In!"
end

def write_a_peep
  fill_in "peep", :with => "Hello World!"
  click_button "Peep!"
end
