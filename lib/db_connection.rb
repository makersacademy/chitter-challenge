require "pg"

class DBConnection
  def self.setup(db_name)
    # dbc = database connection
    @dbc = PG.connect(dbname: db_name)
  end

  def self.query(sql)
    @dbc.exec(sql)
  end
end
