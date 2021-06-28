require 'pg'

class Chitter

  attr_reader :id, :name, :message, :time

  def initialize(id:, name:, message:, time:)
    @id = id
    @name = name
    @message = message
    @time = time
  end

  def self.all
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'chitter_peeps_test')
    else
      connection = PG.connect(dbname: 'chitter_peeps')
    end
    
    result = connection.exec("SELECT * FROM news_feed ORDER BY id DESC;")
    result.map do |peeps|
      Chitter.new(id: peeps['id'], name: peeps['name'], message: peeps['message'], time: peeps['time'])
    end
  end

  def self.create(name:, message:, time:)
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'chitter_peeps_test')
    else
      connection = PG.connect(dbname: 'chitter_peeps')
    end

    result = connection.exec("INSERT INTO news_feed (name, message, time) VALUES('#{name}', '#{message}', '#{time}') RETURNING name, message, time;")
    Chitter.new(id: result[0]['id'], name: result[0]['name'], message: result[0]['message'], time: result[0]['time'])
  end
end