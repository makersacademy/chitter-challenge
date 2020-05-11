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
    result.map do |peep|
      text = peep['text']
      time = peep['time']
      dated_text = "#{text} made on #{time}"
    end 

    #result.map { |peep| peep['teßxt'] }
  end 

  def self.create(text:, time:)
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'chitter_test')
    else
      connection = PG.connect(dbname: 'chitter')
    end
    connection.exec("INSERT INTO peep_record (text, time) VALUES('#{text}','#{time}')")
  end 
end 
