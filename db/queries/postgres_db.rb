require 'dotenv'
require 'pg'

class PGDatabase 

  Dotenv.load
  
  def self.connect(db)
    @con = PG.connect :dbname => db, :user => ENV['DBUSER'], :password => ENV['DBPASSWORD']
  end

  def self.connection
    @con
  end


end