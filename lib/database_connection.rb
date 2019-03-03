require 'pg'

class Database_Connection
  def self.setup
    p ENV['Environent']
    if ENV['Environent'] == 'test'
      name = 'chitter_database_test'
    else
      name = 'chitter_database'
    end
    @conn = PG.connect(dbname: name)
  end

  def self.querry(querry_string)
    @conn.exec(querry_string)
  end
end
