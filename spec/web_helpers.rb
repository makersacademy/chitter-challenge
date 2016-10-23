def sign_up
  fill_in :new_username,      with: 'myusername'
  fill_in :new_email,         with: 'myemail@email.com'
  fill_in :new_name,          with: 'myname'
  fill_in :new_password,      with: 'mypassword!'
  click_button "Sign up"
    Peep.create(text: 'I am feeling good')
end

# def sign_in
#
#     User.create(username: 'myusername',
#                 email: 'myemail@email.com',
#                 name: 'myname',
#                 password: 'mypassword')
#     Peep.create(text: 'I am feeling good')
#
#   visit '/'
#   fill_in :username,      with: 'myusername'
#   fill_in :password,      with: 'mypassword'
#   click_button "Login"
# end
