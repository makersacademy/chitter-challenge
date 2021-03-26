require 'pg'

class DbConnection
  class << self
    attr_reader :connected
  end
  
  def self.setup(dbname)
    @connected = PG.connect :dbname => dbname
  end

  def self.query(query)
    @connected.exec query
  end

  def self.check_env
    if ENV['ENVIRONMENT'] == 'test'
      setup('chitter_test') # , 
                      #  :user => 'makers', :password => 'makers'
    else
      setup('chitter') # , 
                      #  :user => 'makers', :password => 'makers'
    end
  end
end
