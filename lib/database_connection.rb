class DatabaseConnection
  attr_reader :con

  def self.setup(db_name)
    @con = PG.connect dbname: db_name
  end

  def self.query(sql)
    @con.exec sql
  end
end
