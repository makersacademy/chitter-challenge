def sign_up
  visit '/users/new'

  fill_in :name, with: 'Peter Pan'
  fill_in :username, with: 'peterpan'
  fill_in :email, with: 'peter@neverland.com'
  fill_in :password, with: 'password'

  click_on 'Join Now'
end

def sign_up_and_log_out
  sign_up
  click_on :'Log Out'
end

def log_in
  click_on :'Log In'

  fill_in :username, with: 'peterpan'
  fill_in :password, with: 'password'
  click_on 'log-in-form'
end

def sign_up_alt
  visit '/users/new'

  fill_in :name, with: 'Minnie Mouse'
  fill_in :username, with: 'minniemouse'
  fill_in :email, with: 'minnie@disneyland.com'
  fill_in :password, with: 'password'

  click_on 'Join Now'
end

def add_peep
  fill_in 'body', with: 'My first peep'
  click_on 'Post' 
end
