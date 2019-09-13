require 'pg'

class Database_Helper
  def self.clear_table
      DatabaseConnection.query('TRUNCATE TABLE chitters CASCADE')
  end

  def self.load_table
      DatabaseConnection.query("INSERT into chitters (id, peep, create_date) VALUES(1, 'peep 1')")
      DatabaseConnection.query("INSERT into chitters (id,  peep, create_date) VALUES(2, 'peep 2')")
      DatabaseConnection.query("INSERT into chitters (id,  peep, create_date) VALUES(3, 'peep 3')")
  end
end
