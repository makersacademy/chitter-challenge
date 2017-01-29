def sign_up
  visit '/'
  click_link('Sign up')
  fill_in(:name, with: 'Kat')
  fill_in(:username, with: 'katmhicks')
  fill_in(:email, with: 'kmhicks92@gmail.com')
  fill_in(:password, with: '1234')
  fill_in(:confirm_password, with: '1234')
  click_button('Submit')
end

def login
  visit '/'
  click_link('Log in')
  fill_in(:email, with: 'kmhicks92@gmail.com')
  fill_in(:password, with: '1234')
  click_button 'Log in'
end

def post_peep
  fill_in(:peep, with: 'Posting my first peep!')
  click_button('Peep')
end
