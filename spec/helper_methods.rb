def sign_up
  visit '/user/new'
  fill_in :name, with: 'John'
  fill_in :username, with: 'JohnDude'
  fill_in :email, with: 'john@john.com'
  fill_in :password, with: 'J0hn123!'
  click_button 'Start Peeping!'
end
