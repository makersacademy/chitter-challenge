require 'pg'

class DbConnection
  def self.connected
    @connected
  end
  
  def self.setup(dbname)
    @connected = PG.connect :dbname => dbname
  end

  def self.query(query)
    @connected.exec query
  end

  def self.check_env
    if ENV['ENVIRONMENT'] == 'test'
      self.setup('chitter_test') # , 
                      #  :user => 'makers', :password => 'makers'
    else
      self.setup('chitter') # , 
                      #  :user => 'makers', :password => 'makers'
    end
  end
end