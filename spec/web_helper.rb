def sign_up
  visit '/'
  fill_in :name, with: 'Steve'
  fill_in :username, with: 'SteveSmith'
  fill_in :email, with: 'steve@stevesmail.com'
  fill_in :password, with: 'bananas'
  click_button 'Sign Up!'
end
