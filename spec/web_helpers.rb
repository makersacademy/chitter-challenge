def sign_up(options = {})
  visit('/users/signup')
  fill_in :email, with: options.fetch(:email, 'test@example.com')
  fill_in :name, with: options.fetch(:name, 'Chit Ter')
  fill_in :username, with: options.fetch(:username, 'sir_chitter')
  fill_in :password, with: options.fetch(:password, 'foobar')
  fill_in :password_confirmation, with: options.fetch(:password_confirmation, 'foobar')
  click_button('Sign Up')
end

def sign_in(options = {})
  visit('/users/signin')
  fill_in :email, with: options.fetch(:email, 'test@example.com')
  fill_in :password, with: options.fetch(:password, 'foobar')
  click_button('Sign In')
end

def sign_out
  click_link 'Sign Out'
end

def peep(message)
  visit '/home'
  fill_in :peep, with: message
  click_button 'Peep'
end
