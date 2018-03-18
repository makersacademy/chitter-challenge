require 'pg'

class DatabaseConnection
  attr_reader :con, :database_name
  def self.setup
    @con = if ENV['ENVIRONMENT'] == 'test'
             PG.connect(dbname: 'chitter_test')
            else
              PG.connect(dbname: 'chitter')
          end
  end

  class << self
    attr_reader :con
  end

  def self.query(sql_string)
    setup()
    @con.exec(sql_string)
  end
end
