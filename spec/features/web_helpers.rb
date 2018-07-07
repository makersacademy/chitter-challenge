def sign_up
  visit '/'
  click_button 'Sign Up'
  fill_in :name, with: 'Jane Doe'
  fill_in :username, with: 'JaneDoe'
  fill_in :email, with: 'janedoe@google.com'
  fill_in :password, with: 'pa$$w0rd'
  click_button 'Sign Up'
end
