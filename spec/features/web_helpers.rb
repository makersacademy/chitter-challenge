def sign_up
  visit '/users/new'
  fill_in 'email', :with => 'user@user.com'
  fill_in 'password', :with => 'password123'
  fill_in 'name', :with => 'User'
  fill_in 'username', :with => 'username'
  click_button 'Sign Up!'
end

def sign_in
  visit '/session/new'
  fill_in 'email', :with => 'user@user.com'
  fill_in 'password', :with => 'password123'
  click_button "Sign In"
end
