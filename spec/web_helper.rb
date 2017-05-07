def sign_up
  visit '/signup'
  fill_in :name, with: 'Reshma'
  fill_in :username, with: 'Reshma123'
  fill_in :email, with: 'reshma@test.com'
  fill_in :password, with: 'password'
  click_button('Sign Up')
end
