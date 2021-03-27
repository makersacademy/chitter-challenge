require 'pg'
require_relative '../db_connection_setup'

class DB
  def self.setup(db_name)
    @conn = PG.connect(dbname: db_name)
  end

  def self.connection
    p '-----------------'
    p 'connection:'
    p @conn
    p '-----------------'
    @conn
  end

  def self.query(sql)
    p '-----------------'
    p 'query connection:'
    p @conn
    p '-----------------'
    @conn.exec(sql)
  end
end
