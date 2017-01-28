def register
  visit '/'
  click_link('Sign up')
  fill_in(:name, with: 'Chloe')
  fill_in(:email, with: 'chloe.i.phillips@hotmail.co.uk')
  fill_in(:password, with: 'abc')
  fill_in(:confirm_password, with: 'abc')
  click_button('Submit')
end
