def sign_up
  user1 = User.create(username: 'myusername2', email: 'myemail2@email.com', name: 'myname2', password: 'mypassword2')
  Peep.create(text: 'I am feeling good', created_at: Time.new, user: user1)
  fill_in :new_username,      with: 'myusername'
  fill_in :new_email,         with: 'myemail@email.com'
  fill_in :new_name,          with: 'myname'
  fill_in :new_password,      with: 'mypassword'
  click_button "Sign up"
end

def log_in
  user1 = User.create(username: 'myusername2', email: 'myemail2@email.com', name: 'myname2', password: 'mypassword2')
  Peep.create(text: 'I am feeling good', created_at: Time.new, user: user1)
  fill_in :username,      with: 'myusername2'
  fill_in :password,      with: 'mypassword2'
  click_button "Login"
end
