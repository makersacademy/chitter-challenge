def login
  register
  click_button 'Log Out'
  visit '/'
  click_button 'Login'
  fill_in 'Email', with: 'fake@fake.com'
  fill_in 'Password', with: 'password'
  click_button 'Login'
end
