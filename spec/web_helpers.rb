def sign_up(name: 'marcus',
            username: 'marc_1',
            email: 'marcus@keb.com',
            password: 'kebab1',
            password_confirmation: 'kebab1')
  visit('/')
  click_button('Sign up')
  fill_in :name, with: name
  fill_in :username, with: username
  fill_in :email, with: email
  fill_in :password, with: password
  fill_in :password_confirmation, with: password_confirmation
  click_button('Sign up')
end

def sign_in(username: 'marc_1',
            password: 'kebab1')
  visit('/')
  click_button('Sign in')
  fill_in :username, with: username
  fill_in :password, with: password
  click_button('Sign in')
end
