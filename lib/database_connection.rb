
class DatabaseConnection

  # def self.setup(dbname = 'chitter')
  #   @conn = 
  # end

  def self.connect
    @conn = PG.connect(dbname: 'chitter')
  end

  def self.query(sql, args = [])
    @conn.exec_params(sql, args)
  end
end