def sign_up(name, username, email, password)
  visit '/users/new'

  fill_in :name, with: name
  fill_in :username, with: username
  fill_in :email, with: email
  fill_in :password, with: password

  click_on 'Join Now'
end

def sign_up_alt
  visit '/users/new'

  fill_in :name, with: 'Minnie Mouse'
  fill_in :username, with: 'minniemouse'
  fill_in :email, with: 'minnie@disneyland.com'
  fill_in :password, with: 'password'

  click_on 'Join Now'
end

def log_in(username, password)
  click_on 'new-session'

  fill_in 'username', with: username
  fill_in 'password', with: password

  click_on 'log-in-form'
end

def add_peep
  visit '/peeps'
  fill_in 'body', with: 'My first peep'
  click_on 'Post' 
end

def other_user_adds_peep
  sign_up('Peter Pan', 'peterpan', 'peter@neverland.com', 'password')
  fill_in 'body', with: 'My first peep'
  click_on 'Post' 
  click_on 'Log Out'
end
