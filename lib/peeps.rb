class Peeps 

  def self.feed 
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'chitter_test')
    else
      connection = PG.connect(dbname: 'chitter')
    end

    result = connection.exec("SELECT * FROM peeps")
    result.map { |peeps| peeps['peep'] } 
  end 
end