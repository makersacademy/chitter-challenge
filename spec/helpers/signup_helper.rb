def register
  visit '/'
  click_button 'Sign Up'
  fill_in 'Username', with: 'fakeuser'
  fill_in 'Email', with: 'fake@fake.com'
  fill_in 'Password', with: 'password'
  click_button 'Register'
end
