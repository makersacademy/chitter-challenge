# frozen_string_literal: true

require 'pg'

# class that handles the responsibility of creating and maintaining a connection
# to the database
class DatabaseConnection
  def self.setup(dbname:)
    @connection = PG.connect(dbname: dbname)
  end

  def self.connection
    @connection
  end

  def self.query(sql)
    @connection.exec(sql)
  end
end
