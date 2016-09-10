def sign_up(name, email, username, password, password_confirmation)
  visit '/users/new'
  fill_in('name', with: name)
  fill_in('email', with: email)
  fill_in('username', with: username)
  fill_in('password', with: password)
  fill_in('password_confirmation', with: password_confirmation)
  click_button('Sign me up!')
end

def log_in(email, password)
  visit '/sessions/new'
  fill_in('email', with: email)
  fill_in('password', with: password)
  click_button('Log in')
end

def add_peep
  click_button('New peep')
  fill_in('content', with: 'testing')
  click_button('Peep!')
end
