require 'pg'

class Peep
  def initialize
    
  end

  def self.all
    connection = PG.connect(dbname: 'chitter_test')
    result = connection.exec("SELECT * FROM peeps;")
    result.map do |peep|
      peep['content']
    end
  end    
end