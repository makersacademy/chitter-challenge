def sign_up
  visit('/')
  fill_in :email, with: 'test@testemail.com'
  fill_in :password, with: 'test123'
  fill_in :name, with: 'Jonny'
  fill_in :user_name, with: 'JonnyK'
  click_button 'Submit'
end