def create_peep(content:)
  visit '/peeps/new'
  fill_in :content, with: content
  click_button 'Submit'
end

def sign_up(name: 'Bob', username: 'Bobby', email: 'bob@bob.org',
  password: '12345', password_confirmation: '12345')
  visit '/users/new'
  fill_in :name, with: name
  fill_in :username, with: username
  fill_in :email, with: email
  fill_in :password, with: password
  fill_in :password_confirmation, with: password_confirmation
  click_button 'Sign up'
end

def sign_in(email:, password:)
  visit('/sessions/new')
  fill_in :email, with: email
  fill_in :password, with: password
  click_button 'Sign in'
end

def sign_out
  click_button 'Sign out'
end
