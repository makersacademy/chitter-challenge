def signup_and_submit
  visit('/')
  click_on 'Sign Up'
  fill_in :firstname, with: 'Carol'
  fill_in :surname, with: 'Gardiner'
  fill_in :email, with: 'caz@caz.com'
  fill_in :password, with: 'secret123'
  click_on 'Sign up'
end

def signin_and_submit
  visit('/')
  click_on 'Sign in'
  fill_in :email, with: 'caz@caz.com'
  fill_in :password, with: 'secret123'
  click_on 'Sign in'
end