require "pg"
	
	class DbConnection
	  attr_reader :connection
	  def self.setup(db_name)
	    @connection = PG.connect(dbname: db_name)
	  end
	
	  def self.query(query)
	    @connection.exec(query)
	  end
	
	  def self.connection
	    @connection
	  end
	end