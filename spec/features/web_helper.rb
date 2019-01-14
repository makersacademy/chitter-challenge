def createpeep
  visit "/profile"
  fill_in :peep, with: "Hello, world"
  click_button "Submit"
end

def createsecondpeep
  visit "/profile"
  fill_in :peep, with: "Hello again, world"
  click_button "Submit"
end

def signuptest
  visit '/'
  click_on 'Sign Up'
  fill_in :email, with: 'test@test.com'
  fill_in :password, with: 'testpassword'
  fill_in :actualname, with: 'testy mctestface'
  fill_in :username, with: "test"
  click_button 'Submit'
end

def logintest
  visit '/signin'
  click_on "Sign In"
  fill_in :email, with: 'test@test.com'
  fill_in :password, with: 'testpassword'
  click_button 'Submit'
end

def loginbadpass
  visit '/signin'
  click_on "Sign In"
  fill_in :email, with: 'test@test.com'
  fill_in :password, with: 'testpassword1'
  click_button 'Submit'
end
