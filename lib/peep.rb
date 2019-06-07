require 'pg'

class Peep 
  attr_reader :id, :username, :name, :text, :date_time
  def initialize(id:, username:, name:, text:, date_time:)
    @id = id
    @username = username
    @name = name
    @text = text
    @date_time = date_time
  end
  
  def self.create_connection
    if ENV['ENVIRONMENT']== 'test'
      @connection = PG.connect(dbname: 'chitter_test')
    else
      @connection = PG.connect(dbname: 'chitter')
    end
  end 

  def self.all
    Peep.create_connection
    result = @connection.exec('SELECT * FROM peeps ORDER BY date_time DESC')
    result.map do |peep|
      Peep.new(id: peep['id'], username: peep['username'], name: peep['name'], text: peep['text'], date_time: peep['date_time'])
    end
  end 
end 