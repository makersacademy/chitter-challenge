def join(name: 'Gio',
         password: '123',
         confirm_password: '123')
  visit ('/')
  click_button('Join')
  fill_in 'Username', with: name
  fill_in 'Password', with: password
  fill_in 'Confirm_password', with: confirm_password
  click_button('Join')
end

def log_in(name: 'Gio',
         password: '123')
  visit ('/')
  click_button('Log-in')
  fill_in 'Username', with: name
  fill_in 'Password', with: password
  click_button('Log-in')
end
