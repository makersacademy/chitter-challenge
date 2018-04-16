def create_user_tester
  visit('/')
  click_button 'Create new user'
  fill_in('email', :with => 'test@test.co.uk' )
  fill_in('password', :with => 'Test123' )
  fill_in('name', :with => 'Tester' )
  fill_in('username', :with => 'DjTesto' )
  click_button 'Submit'
end
