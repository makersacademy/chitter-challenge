def register_new_user
  visit '/'
  click_button('Sign up!')
  fill_in(:username, with: 'BTrain012')
  fill_in(:name, with: 'James Borrell')
  fill_in(:email, with: 'btrain012@gmail.com')
  fill_in(:password, with: 'btrain')
  click_button('Sign Up!')
end

def sign_in_user
  fill_in(:email, with: 'btrain012@gmail.com')
  fill_in(:password, with: 'btrain')
  click_button("Sign In")
end
