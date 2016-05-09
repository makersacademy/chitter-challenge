module SessionHelpers

 def sign_in(email:, password:)
   visit '/sessions/new'
   fill_in :email, with: email
   fill_in :password, with: password
   click_button 'Sign in'
 end

 def sign_up(name: 'elia',
   username: 'elia-uk',
   email: "elia@gmail.com",
 password: "Obp23",
  password_confirmation: "Obp23")
   visit '/users/new'
   fill_in :name, with: name
   fill_in :username, with: username
   fill_in :email, with: email
   fill_in :password, with: password
   fill_in :password_confirmation, with: password_confirmation
   click_button 'Sign up'
 end
end
