def sign_up(name, username, email, password)
  visit '/'
  click_on 'Sign up'
  fill_in :name, with: name
  fill_in :username, with: username
  fill_in :email, with: email
  fill_in :password, with: password
  click_button 'Sign up'
end

def sign_in(email, password)
  visit '/'
  click_on 'Sign in'
  fill_in :email, with: "bea@bea.com"
  fill_in :password, with: "hello12345"
  click_button 'Sign in'
end

def logout_user
  click_button('Logout')
end
