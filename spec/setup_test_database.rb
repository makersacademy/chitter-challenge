require 'pg'
require_relative 'login_helper'

def setup_test_database
  connection = PG.connect(dbname: 'chitter_test')
  connection.exec("TRUNCATE peep, chitter_user;")
  register
end
