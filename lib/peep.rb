require 'pg'

class Peep

  def self.sql(query)
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'chitter_manager_test')
    else
      connection = PG.connect(dbname: 'chitter_manager')
    end
    connection.exec(query)
  end

  def self.all
    result = sql("SELECT * FROM peep;")
    result.map { |sqlresult| sqlresult['message'] }
  end  
end
