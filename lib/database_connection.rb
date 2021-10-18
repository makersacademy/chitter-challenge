require 'pg'

class DatabaseConnection

  def self.setup(dbname)
    @current = PG.connect(dbname: dbname)
  end

  def self.query(sql, params = [])
    @current.exec_params(sql, params)
  end
end
