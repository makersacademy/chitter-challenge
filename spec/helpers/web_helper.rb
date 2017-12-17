module SessionHelpers

#  Message Creation Helpers

def post_new_message(message: "MA Chitter is a cool app - 1" )
  visit '/messages/new'
  fill_in 'message', with: message
  click_button 'Peep'
end

def post_other_message
  Message.create(message: 'MA Chitter kicks Twitter A@@! - 2', created_at: Time.now + 60 )
  visit '/messages'
end

# User Creation Helpers

def sign_up(user_name: 'Nikolaos',
            user_email: 'nikolaos@example.com',
            passsword: 'test1234',
            password_confirmation: 'test1234')
   visit '/users/new'
   fill_in :user_name, with: user_name
   fill_in :user_email, with: user_email
   fill_in :password, with: passsword
   fill_in :password_confirmation, with: password_confirmation
   click_button 'Sign Up'
 end

 # User Sign-In helpers

def sign_in(email: 'nikolaos@example.com', password: 'test1234')
   visit '/sessions/new'
   fill_in :user_email, with: email
   fill_in :password, with: password
   click_button 'Sign in'
 end

end
