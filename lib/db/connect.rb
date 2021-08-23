require 'pg'
class Connect 

  def self.initiate(dbname)
    @dbname = dbname.to_s
    @dbname << '_test' if ENV['RACK_ENV'] == 'test'
    PG.connect(dbname: @dbname)
  end

end
