def prepare_databases
  connection = PG.connect(dbname: 'chitter_test')
  connection.exec("INSERT into users VALUES (1, 'Mr Canary', 'password', 'Canary', 'email@email.com')")
  connection.exec("INSERT into peeps VALUES ( 1, 1, 'this is a test', '2018-11-20 9:00:00',NULL)")
end

def sign_up
  visit('/')
  click_link('Register a chitter account')
  fill_in('name', with: 'Mr User')
  fill_in('username',with: 'madeUpUser')
  fill_in('email', with: "email@email.com")
  fill_in('password', with: "password")
  click_on('Submit')
end
