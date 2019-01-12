
def sign_up(email = 'someone@somewhere.com', password = 'password')
    visit '/'
    click_on 'Sign up'
    fill_in :email, with: email
    fill_in :password, with: password
    click_button 'Sign up'
  end
  
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