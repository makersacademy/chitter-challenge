def sign_up(name: 'Donald Trump',
             username: 'don123',
             email: 'don123@gmail.com',
             password: '123456',
             password_confirmation: '123456')
   visit '/users/new'
   fill_in :name, with: name
   fill_in :username, with: username
   fill_in :email, with: email
   fill_in :password, with: password
   fill_in :password_confirmation, with: password_confirmation
   click_button 'Sign up!'
 end

 def sign_in
   visit '/sessions/new'
   fill_in :username, with: 'don123'
   fill_in :password, with: '123456'
   click_button 'Sign in'
 end

 def sign_out
   click_button 'Sign out'
 end

 def sign_in_with_wrong_password
   visit '/sessions/new'
   fill_in :username, with: 'don123'
   fill_in :password, with: '654321'
   click_button 'Sign in'
 end
