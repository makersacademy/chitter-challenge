def sign_up_and_get_peeping
  visit '/peeps'
  click_button 'Sign Up'
  fill_in('name', with: 'test')
  fill_in('email', with: 'test@test.com')
  fill_in('username', with: 'test_name')
  fill_in('password', with: 'Test123')
  click_button 'Get Peeping'
end
