require 'pg'
require 'singleton'

class DatabaseConnection
  include Singleton

  def self.setup(dbname)
    @con = PG.connect(dbname: dbname)
  end

  def self.query(sql, params = [])
    @con.exec_params(sql, params)
  end
end
