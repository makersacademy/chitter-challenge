require 'pg'
require 'timecop'

class Peep

  attr_reader :id, :name, :message, :time

  def initialize(id:, name:, message:, time:)
    @id = id
    @name = name
    @message = message
    @time = time
  end

  def self.all
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'chitter_test')
    else
      connection = PG.connect(dbname: 'chitter')
    end
    result = connection.exec("SELECT * FROM peeps ORDER BY time ASC")
    result.map do |peep|
      Peep.new(id: peep['id'], name: peep['name'], message: peep['message'], time: peep['time'])
    end
  end

  def self.view_time_desc
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'chitter_test')
    else
      connection = PG.connect(dbname: 'chitter')
    end
    result = connection.exec("SELECT * FROM peeps ORDER BY time DESC")
    result.map do |peep|
      Peep.new(id: peep['id'], name: peep['name'], message: peep['message'], time: peep['time'])
    end
  end

  def self.create(name:, message:)
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'chitter_test')
    else
      connection = PG.connect(dbname: 'chitter')
    end
    query = "INSERT INTO peeps (name, message) VALUES('#{name}', '#{message}') RETURNING id, name, message, time;"
    result = connection.exec(query)
    Peep.new(id: result[0]['id'], name: result[0]['name'], message: result[0]['message'], time: result[0]['time'])
  end

end
