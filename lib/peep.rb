require 'pg'

class Peep

  attr_reader :id, :text, :time
  
  def initialize(id:, text:, time:)
    @id = id
    @text = text
    @time = time
  end

  def self.all
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'chitter_test')
    else
      connection = PG.connect(dbname: 'chitter')
    end 
    result = connection.exec("SELECT * FROM peeps;")

    result.map do |peep| 
      Peep.new(id: peep['id'], text: peep['text'],
      time: convert_time(peep['time']))
    end.sort_by { |peep| peep.time }.reverse
    # time doesn't sort accurately with sql ORDER BY
    # it's also useful to convert back to a time object here for presenting in html
  end

  def self.create(text:)
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'chitter_test')
    else
      connection = PG.connect(dbname: 'chitter')
    end
    result = connection.exec_params(
      "INSERT INTO peeps(text, time) VALUES($1, $2) RETURNING id, text, time;", [text, Time.now.utc]
    )
  
    Peep.new(id: result[0]['id'], text: result[0]['text'],
    time: convert_time(result[0]['time']))
  end

  private

  def self.convert_time(string)
    Time.strptime(string, '%Y-%m-%d %H:%M:%S')
    # turns the string in the db back into a time object for easier formatting and testing
  end
  
end
