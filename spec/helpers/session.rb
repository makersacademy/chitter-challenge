module SessionHelpers

 def sign_in(email:, password:)
   visit '/sessions/new'
   fill_in :email, with: email
   fill_in :password, with: password
   click_button 'Sign in'
 end

 def sign_up(email: 'alice@example.com',
             password: '12345678')
   visit '/users/new'
   fill_in :email, with: email
   fill_in :password, with: password
   click_button 'Sign up'
 end

end
