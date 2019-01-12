
## this need to be tidied
def start_sign_up
    visit '/'
    click_on 'Sign up'
end

def sign_up_name(name = 'bob')
  fill_in :name, with: name
end

def sign_up_username(username = 'jack')
  fill_in :username, with: username
end

def sign_up_password(password = 'password')
  fill_in :password, with: password
end

def sign_up_email(email = 'someone@somewhere.com')
  fill_in :email, with: email
end

def submit_sign_up 
    click_button 'Sign up'
end

def generic_signup
  start_sign_up
  sign_up_name
  sign_up_username
  sign_up_email
  sign_up_password
  submit_sign_up
end

###
  
   def logout_user
     click_button('Log out')
   end
  
   def sign_in(email, password)
     visit '/'
     click_on 'Sign in'
     fill_in :email, with: email
     fill_in :password, with: password
     click_button 'Sign in'
   end