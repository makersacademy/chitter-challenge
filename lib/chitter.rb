require 'pg'
require_relative './peep'
require_relative './database_connection'
require_relative '../database_connection_setup.rb'

class ChitterDB

  def self.list
    result = DatabaseConnection.query('SELECT * FROM peeps')
  end

end
