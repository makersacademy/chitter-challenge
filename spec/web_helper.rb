def sign_up
  visit('/')
  fill_in('username', with: 'jon snow')
  fill_in('email', with: 'jon_snow@nightswatch.com')
  fill_in('password', with: 'ygritte')
  click_button('Sign up')
end
