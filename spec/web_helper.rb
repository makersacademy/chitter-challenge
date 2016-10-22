def sign_up
  visit '/sign-up'
  fill_in 'email', :with => 'elizabeth@makers.com'
  fill_in 'password', :with => 'password'
  fill_in 'name', :with => 'Elizabeth'
  fill_in 'username', :with => 'elizard'
  click_button 'Sign up'
end
