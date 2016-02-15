def sign_up(name: 'Steve',
            username: 'SteveSmith',
            email: 'steve@stevesmail.com',
            password: 'bananas',
            password_confirmation: 'bananas'
            )
  visit '/users/new'
  fill_in :name, with: name
  fill_in :username, with: username
  fill_in :email, with: email
  fill_in :password, with: password
  fill_in :password_confirmation, with: password_confirmation
  click_button 'Sign Up!'
end
