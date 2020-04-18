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

def add_peep
  fill_in 'body', with: 'My first peep'
  click_on 'Post' 
end
