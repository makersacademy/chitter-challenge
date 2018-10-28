def sign_in
  visit '/'
  click_button 'Sign up'
  fill_in('first_name', with: 'Gordon')
  fill_in('last_name', with: 'Brown')
  fill_in('email', with: 'gbrown@gmail.com' )
  fill_in('password', with: 'secret')
  fill_in('username', with: 'gbrown')
  click_button 'Submit'
end
