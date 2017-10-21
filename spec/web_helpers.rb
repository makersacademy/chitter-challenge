def sign_up(args = {})
  email = args.fetch(:email, 'no@email.com')
  handle = args.fetch(:handle, 'ainsleybc')
  name = args.fetch(:name, 'Ainsley Chang')
  password = args.fetch(:password, 'password')

  visit '/users/new'
  fill_in :email, with: email
  fill_in :handle, with: handle
  fill_in :name, with: name
  fill_in :password, with: password
  click_button 'Register'
end

def log_in(args)
  email = args.fetch(:email, 'no@email.com')
  password = args.fetch(:password, 'password')

  visit '/sessions/new'
  fill_in :email, with: email
  fill_in :password, with: password
  click_button 'Log in'
end

def log_out
  click_button 'Log out'
end