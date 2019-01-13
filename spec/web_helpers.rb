def send_peep  
  visit '/'
  fill_in :message, with: 'One man must peep'
  click_on 'Submit'
end

def sign_up
  visit '/'
  click_on 'Sign Up'
  fill_in :email, with: '1@2.com'
  fill_in :password, with: 'securepassword'
  fill_in :username, with: 'User1'
  click_button 'Submit'
end
