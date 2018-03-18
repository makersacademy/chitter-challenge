require 'pg'

class DBconnection

  class << self
    attr_reader :con
  end

  def self.setup(dbname)
    @con = PG.connect(dbname: dbname)
  end

  def self.query(sql)
    @con.exec(sql)
  end

end
