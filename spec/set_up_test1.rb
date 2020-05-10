require 'pg'
require_relative 'spec_helper'

def set_up_profile
  p "setting up db"
  connection = PG.connect(dbname: 'chitter_test')
  connection.exec("TRUNCATE profile;")
end

def set_up_peeps
  p "setting up db"
  connection = PG.connect(dbname: 'chitter_test')
  connection.exec("TRUNCATE peeps;")
end
