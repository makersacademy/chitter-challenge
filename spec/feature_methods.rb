require 'feature_spec'
require 'pg'

def signin_process
MakerPeep.create(peep: "Hey!", username: "Laura", datetime: "09/05/2020")
MakerPeep.all
visit ('/')
click_button('Sign Up')
fill_in("name", with: 'Sally')
fill_in('username', with: 'Sally94')
fill_in('email', with: 'sal@gmail.com')
fill_in('password', with: 'Sally94')
click_button('Sign Up')
end 
