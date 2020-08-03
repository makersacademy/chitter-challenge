require 'pg'

class DatabaseConnection

  def self.setup(dbname)
    @database = PG.connect(dbname: dbname, user: 'postgres', password: '')
  end

  def self.query(args)
    @database.exec(args)
  end

end
