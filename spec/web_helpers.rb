def register_new_user(username: 'BTrain012',
                      name: 'James Borrell',
                      email: 'btrain012@gmail.com',
                      password: 'btrain',
                      password_confirmation: 'btrain')
  visit '/'
  click_button('Sign up!')
  fill_in(:username, with: username)
  fill_in(:name, with: name)
  fill_in(:email, with: email)
  fill_in(:password, with: password)
  fill_in(:password_confirmation, with: password_confirmation)
  click_button('Sign Up!')
end

def sign_in_user
  fill_in(:email, with: 'btrain012@gmail.com')
  fill_in(:password, with: 'btrain')
  click_button("Sign In")
end
