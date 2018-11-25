require 'setup_test_database'
require 'user'

describe User do
  it 'adds a new user to the db' do
    connection = PG.connect(dbname: "chitter_test")
    connection.exec("TRUNCATE users, peeps;")
    user = User.create(email: 'lucaf@gmail.com', password: 'password', name: 'luca', username: 'luca89')
    User.create(email: 'lucafr@gmail.com', password: 'password', name: 'luca', username: 'lucafr89')
  end
end
