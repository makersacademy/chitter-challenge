def sign_up
  visit '/'
  click_link 'Sign Up'
  fill_in :name, with: "Bertie"
  fill_in :email, with: "Test.email@test.com"
  fill_in :username, with: "BertZ"
  fill_in :password, with: "Password1234"
  click_button "Create Account"
end
