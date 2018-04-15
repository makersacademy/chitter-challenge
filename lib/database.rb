require 'pg'
require_relative 'helpers'

class Database
  CONNECTION = PG::Connection.open(DatabaseHelper.connection_details)

  def self.execute(request, params = [])
    CONNECTION.exec(request, params)
  end
end
