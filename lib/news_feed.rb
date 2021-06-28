require 'pg'

class NewsFeed 
  attr_reader :id, :name, :message, :time

  def intialize(id:, name:, message:, time:)
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

    result = connection.exec('SELECT * FROM news_feed ORDER BY id DESC;')

    result.map do |peep|
      peep
    end
  end

  def self.create(name:, message:, time:)
    if ENV['ENVIRONMENT'] =='test'
      connection = PG.connect(dbname: 'chitter_test')      
    else
      connection = PG.connect(dbname: 'chitter')   
    end

    connection.exec("INSERT INTO news_feed (name, message, time) VALUES('#{name}', '#{message}', '#{time}') RETURNING name, message, time;")
  end
end