def register
  visit '/'
  click_link('Sign Up')
  fill_in(:name, with: 'Kat')
  fill_in(:email, with: 'kmhicks92@gmail.com')
  fill_in(:password, with: '1234')
  fill_in(:confirm_password, with: '1234')
  click_button('Submit')
end
