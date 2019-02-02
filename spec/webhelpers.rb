def database_wiper
  Beep.destroy_all unless ENV['database_hash'] == 'chipchune'
  User.destroy_all unless ENV['database_hash'] == 'chipchune'
end

def autoregister
  visit('/')
  click_on('sign-up')
  fill_in 'username', with: 'kawaiichan@netscape.com'
  fill_in 'username', with: 'testyboy'
  fill_in 'password', with: 'password123'
  click_on('register')
end
