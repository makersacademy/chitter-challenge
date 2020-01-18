require 'pg'

class Message

  attr_reader :id, :content, :time

  def initialize(id:, content:, time:)
    @id = id
    @content = content
    @time = time
  end

  def self.all
    if ENV['ENVIRONMENT'] = 'test'
      connection = PG.connect(dbname: 'chitter_test')
    else
      connection = PG.connect(dbname: 'chitter')
    end 
    result = connection.exec('SELECT * FROM messages ORDER BY id DESC;')
    result.map { |row|
      Message.new(id: row['id'], content: row['content'], time: row['time'])
      }
  end

  def self.times
    if ENV['ENVIRONMENT'] = 'test'
      connection = PG.connect(dbname: 'chitter_test')
    else
      connection = PG.connect(dbname: 'chitter')
    end 
      result = connection.exec('SELECT * FROM messages ORDER BY id DESC;')
      result.map { |row| row['time'] }
  end

  def self.create(content:, time: Time.new)
    if ENV['ENVIRONMENT'] = 'test'
      connection = PG.connect(dbname: 'chitter_test')
    else
      connection = PG.connect(dbname: 'chitter')
    end
    result = connection.exec("INSERT INTO messages (content, time) VALUES('#{content}', '#{time}') RETURNING id, content, time;")
    result.map { |row|
      Message.new(id: row['id'], content: row['content'], time: row['time'])
      }
  end
end