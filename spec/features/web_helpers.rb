def sign_up
  visit '/'
  click_button('Sign up')
  fill_in :username, with: 'erce'
  fill_in :email, with: 'erce@erce.com'
  fill_in :name, with: 'Erce Kal'
  fill_in :password, with: '123456'
  fill_in :password_confirmation, with: '123456'
  click_button('Sign up')
end

def sign_in
  visit '/'
  click_button "Sign in"
  fill_in :email, with: 'erce@erce.com'
  fill_in :password, with: '123456'
  click_button "Sign in"
end
