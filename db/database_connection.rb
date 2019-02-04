# frozen_string_literal: true

require 'pg'

# Class comment...
class DatabaseConnection
  def self.setup(db_name)
    @connection = PG.connect(dbname: db_name)
  end

  class << self
    attr_reader :connection
  end

  def self.query(sql_query)
    @connection.exec(sql_query)
  end
end
