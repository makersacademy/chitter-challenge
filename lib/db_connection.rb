require 'pg'

class DbConnection

  def self.setup(dbname)

    PG.connect(dbname: dbname)

  end

end