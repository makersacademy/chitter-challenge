def signup
  visit ('/chitter')
  click_button('Sign up')
  fill_in('name', :with => 'John Smith')
  fill_in('username', :with => 'JohnSmith3000')
  fill_in('email', :with => 'john@smith.com')
  fill_in('password', :with => 'password')
  click_button('Register')
end
