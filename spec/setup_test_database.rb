require 'pg'
require './lib/peep.rb'
require './lib/user.rb'

def test_setup
  if connection = PG.connect(dbname: 'chitter_test')
    connection.exec("TRUNCATE peeps;")
  elsif connection = PG.connect(dbname: 'user_management_test')
    connection.exec("TRUNCATE users;")
  end
end
