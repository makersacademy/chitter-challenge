def add_user
  conn = PG.connect(dbname: 'chitter_test')
  conn.exec "INSERT INTO users(first_name, last_name, username, password, email) VALUES('haralds',  'kalns', 'haralds_k', 'Pa$$w0rd', 'haralds_k@gmail.com');"
  conn.close
end

def add_messages
  conn = PG.connect(dbname: 'chitter_test')
  conn.exec "INSERT INTO messages(content, time, user_id) VALUES('Hello everyone!', '#{Time.now}', 1);"
  conn.exec "INSERT INTO messages(content, time, user_id) VALUES('Random announcement', '#{Time.now + 50}', 1);"

  conn.exec "INSERT INTO messages(content, time, user_id) VALUES('Good bye!', '#{Time.now + 100}', 1);"
  conn.close
end

def register
  visit '/messages'
  click_button 'sign up'
  fill_in 'first_name', with: 'Arvo'
  fill_in 'last_name', with: 'Kalns'
  fill_in 'username', with: 'arvo_k'
  fill_in 'ui_password', with: 'trex89D'
  fill_in 'ui_password1', with: 'trex89D'
  fill_in 'email', with: 'arvo@gmail.com'
  click_button 'submit'
end
