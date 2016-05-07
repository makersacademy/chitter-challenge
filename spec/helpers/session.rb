module SessionHelpers

 def sign_in(user_name:, password:)
   visit '/sessions/new'
   fill_in :user_name, with: user_name
   fill_in :password, with: password
   click_button 'Sign in'
 end

 def sign_up(password = 's3cr3t!')
   visit '/'
   click_button 'Sign up'
   fill_in :name, with: 'Nick'
   fill_in :user_name, with: 'nmrichards'
   fill_in :email, with: 'batman@gmail.com'
   fill_in :password, with: password
   fill_in :password_confirmation, with: 's3cr3t!'
   click_button 'Sign up'
 end

end
