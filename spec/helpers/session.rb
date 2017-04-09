module SessionHelpers

 def sign_in(email:, password:)
   visit '/sessions/new'
   fill_in :email, with: email
   fill_in :password, with: password
   click_button 'Sign in'
 end

 def sign_up(email: 'jackdopeyman@hotmail.com',
             password: 'password1234',
             password_confirmation: 'password1234')
   visit '/users/new'
   fill_in :email, with: email
   fill_in :password, with: password
   fill_in :password_confirmation, with: password_confirmation
   click_button 'Sign Up'
 end

end
