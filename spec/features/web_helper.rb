def sign_up
  visit '/users/new'
  fill_in :email, with: 'tester1@test.com'
  fill_in :password, with: 'test123'
  fill_in :password_confirmation, with: 'test123'
  fill_in :name, with: 'Tester'
  fill_in :username, with: 'tester1'
  click_button 'Sign Up'
end

def sign_up_wrong
  visit '/users/new'
  fill_in :email, with: 'tester2@test.com'
  fill_in :password, with: 'test111'
  fill_in :password_confirmation, with: 'test222'
  fill_in :name, with: "Tester2"
  fill_in :username, with: 'tester2'
  click_button 'Sign Up'
end

def sign_in
  visit '/session/new'
  fill_in :email, with: 'tester1@test.com'
  fill_in :password, with: 'test123'
  click_button "Sign In"
end

def add_peep
  visit '/peeps/new'
  fill_in :message, with: "Why can't we give love one more chance?"
  click_button "Add Peep"
end

def recover_password
  visit '/users/password-recovery'
  fill_in :email, with: "tester1@test.com"
  click_button("Submit")
end
