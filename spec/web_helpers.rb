def sign_up(usr: 'mmm', p1: 'ooh', p2: 'ooh', email: 'a@oh.ma')

  visit('/')
  click_button('Sign up')
  fill_in('username', with: usr)
  fill_in('password', with: p1)
  fill_in('password_check', with: p2)
  fill_in('email', with: email)
  click_button('Submit')
end
