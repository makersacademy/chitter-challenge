def sign_up
  visit '/users/new'
  fill_in :email, with: 'tester1@test.com'
  fill_in :password, with: 'test123'
  fill_in :name, with: 'Tester'
  fill_in :username, with: 'tester1'
  click_button 'Sign Up'
end

def sign_in
  visit '/session/new'
  fill_in :email, with: 'tester1@test.com'
  fill_in :password, with: 'test123'
  click_button "Sign In"
end
