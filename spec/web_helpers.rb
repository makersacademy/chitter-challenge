def sign_up(name: 'Yev Insomniak',
            username: 'yev_insomniak',
            email: 'incredible@yev.com',
            password: 'bla-bla-bla',
            password_confirmation: 'bla-bla-bla')
  visit '/users/new'
  fill_in :name, with: name
  fill_in :username, with: username  
  fill_in :email, with: email
  fill_in :password, with: password
  fill_in :password_confirmation, with: password_confirmation
  click_button 'Sign up!'
end

def log_in
  visit '/sessions/new'
  fill_in :username, with: 'yev_insomniak'
  fill_in :password, with: 'bla-bla-bla'
  click_button 'Log in'
end

def log_out
  click_button 'Sign out'
end

def log_in_with_wrong_password
  visit '/sessions/new'
  fill_in :username, with: 'yev_insomniak'
  fill_in :password, with: 'the-yev'
  click_button 'Log in'
end

def peep
  visit '/peeps/new'
  fill_in :peep, with: 'My test peep'
  click_button 'PEEP!'
end