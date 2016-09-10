def sign_up
  visit '/users/new'
  fill_in('username', :with => 'mrmurtz')
  fill_in('email', :with => 'murtz@gmail.com')
  fill_in('password', :with => '1234')
  click_button('Sign up')
end
