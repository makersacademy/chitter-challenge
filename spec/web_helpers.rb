def sign_up(options = {})
  fill_in :email, with: options.fetch(:email, 'test@example.com')
  fill_in :name, with: options.fetch(:name, 'Chit Ter')
  fill_in :username, with: options.fetch(:username, 'sir_chitter')
  fill_in :password, with: options.fetch(:password, 'foobar')
  fill_in :password_confirmation, with: options.fetch(:password_confirmation, 'foobar')
  click_button('Sign Up')
end

def sign_in(options = {})
  fill_in :email, with: options.fetch(:email, 'test@example.com')
  fill_in :name, with: options.fetch(:name, 'Chit Ter')
  fill_in :username, with: options.fetch(:username, 'sir_chitter')
  fill_in :password, with: options.fetch(:password, 'foobar')
  fill_in :password_confirmation, with: options.fetch(:password_confirmation, 'foobar')
  click_button('Sign Up')
end
