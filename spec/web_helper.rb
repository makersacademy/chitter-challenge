def join(name: 'Gio',
         password: '123',
         confirm_password: '123')
  visit ('/')
  click_button('Join')
  fill_in 'username', with: name
  fill_in 'password', with: password
  fill_in 'confirm_password', with: confirm_password
  click_button('Join')
end

def log_in(name: 'Gio',
           password: '123')
  visit ('/')
  click_button('Log-in')
  fill_in 'username', with: name
  fill_in 'password', with: password
  click_button('Log-in')
end
