# frozen_string_literal: true

require 'pg'

class DatabaseConnection
  class << self
    attr_reader :connection
  end

  def self.remote_connection(url)
    @connection = PG.connect(url)
  end

  def self.setup(dbname)
    @connection = PG.connect(dbname: dbname)
  end

  def self.query(sql, params = [])
    @connection.exec_params(sql, params)
  end
end
