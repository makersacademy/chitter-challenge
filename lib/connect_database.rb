require 'pg'
require_relative 'choose_peep_database'
require_relative 'choose_user_database'

class ConnectDatabase

  def self.start(pg_class = PG,mode)
    @mode = mode
    @connection = pg_class.connect(dbname: which_database)
  end

  def self.connection
    @connection
  end

  def self.query(sql)
    @connection.exec(sql)
  end

  private

  def self.which_database
    if @mode == 'user'
      which_user_database
    else
      which_peep_database
    end
  end

end
