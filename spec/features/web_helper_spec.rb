
def signin_and_submit
  visit('/signin')
  fill_in :username, with: 'cazzy'
  fill_in :password, with: 'secret123'
  click_on 'Sign in'
end
