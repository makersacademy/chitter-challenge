def createpeep
  visit "/"
  fill_in :peep, with: "Hello, world"
  click_button "Submit"
end

def createsecondpeep
  visit "/"
  fill_in :peep, with: "Hello again, world"
  click_button "Submit"
end

def signuptest
  visit '/'
  click_on 'Sign Up'
  fill_in :email, with: 'test@test.com'
  fill_in :password, with: 'testpassword'
  fill_in :fullname, with: 'testy mctestface'
  fill_in :username, with: "test"
  click_button 'Submit'
end
