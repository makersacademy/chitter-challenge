def sign_up
  visit '/users/new'
  fill_in 'name', with: 'Roxy'
  fill_in 'handle', with: 'Hellebent'
  fill_in 'email', with: 'test@test.com'
  click_button 'Register'
end
