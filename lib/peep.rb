require 'pg'

class Peep

  attr_reader :text, :time

  def self.all
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'chitter_test')
    else
      connection = PG.connect(dbname: 'chitter')
    end

    result = connection.exec("SELECT * FROM peep_record ORDER BY time DESC;")
    result.map { |peep| peep['text'] }
  end 

  def self.create(text:, time:)
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'chitter_test')
    else
      connection = PG.connect(dbname: 'chitter')
    end

    p time

    connection.exec("INSERT INTO peep_record (text, time) VALUES('#{text}','#{time}')")
  end 
end 
