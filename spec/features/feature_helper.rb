def signin
  visit('/signin')
  fill_in('email', with: 'marco@gmail.com')
  fill_in('password', with: '12345')
  click_on('Sign in')
end
