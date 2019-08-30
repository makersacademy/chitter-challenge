class DatabaseConnection
  attr_reader :con

  def self.setup(db_name)
    @con = PG.connect dbname: db_name
  end

  def self.query(sql, params = nil)
    @con.exec_params sql, params
  end
end
