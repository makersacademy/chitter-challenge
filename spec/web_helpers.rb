def sign_up
  visit '/'
  click_button 'Sign Up'
  fill_in :name, with: "Bertie"
  fill_in :email, with: "Test.email@test.com"
  fill_in :username, with: "BertZ"
  fill_in :password, with: "Password1234"
  fill_in :password_confirmation, with: "Password1234"
  click_button "Create Account"
end

def sign_up_wrong_password
  visit '/'
  click_button 'Sign Up'
  fill_in :name, with: "Bertie"
  fill_in :email, with: "Test.email@test.com"
  fill_in :username, with: "BertZ"
  fill_in :password, with: "Password1234"
  fill_in :password_confirmation, with: "Password2345"
  click_button "Create Account"
end

def sign_up_wrong_email
  visit '/'
  click_button 'Sign Up'
  fill_in :name, with: "Bertie"
  fill_in :email, with: "invalid@email"
  fill_in :username, with: "BertZ"
  fill_in :password, with: "Password1234"
  fill_in :password_confirmation, with: "Password1234"
  click_button "Create Account"
end

def sign_in(username:, password:)
  visit '/login_form'
  fill_in :username, with: "BertZ"
  fill_in :password, with: "Password1234"
  click_button 'Login'
end

def create_peep
  click_button 'Send a Peep'
  fill_in :peep, with: "Hello Chitter"
  click_button "Send Peep"
end
