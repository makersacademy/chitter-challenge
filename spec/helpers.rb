module Helpers
def sign_up
  visit '/signup'
  fill_in(:email, with: "john@gmail.com" )
  fill_in(:password, with: "password123" )
  fill_in(:username, with: "goober")
  click_button( 'Start Peeping!' )
end

def sign_up_password_confirmation(username: 'joeschmoe',
              email: 'joe@gmail.com',
              password: '123456789',
              password_confirmation: '123456789')
    visit '/signup'
    fill_in :username, with: username
    fill_in :email, with: email
    fill_in :password, with: password
    fill_in :password_confirmation, with: password_confirmation
    click_button( 'Start Peeping!' )
  end
end
