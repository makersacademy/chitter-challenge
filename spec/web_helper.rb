def register
  visit '/'
  click_link('Sign up')
  fill_in(:name, with: 'Amy')
  fill_in(:email, with: 'amy.j.jenkins@googlemail.com')
  fill_in(:password, with: 'hello')
  fill_in(:confirm_password, with: 'hello')
  click_button('Submit')
end
