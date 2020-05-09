def sign_up
  visit('/peeps/signup')
  fill_in('name', with: 'James Smith')
  fill_in('username', with: 'james_smith')
  fill_in('password', with: 'Password123')
  click_button 'Submit'
end
