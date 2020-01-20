require 'pg'
require_relative 'user'

class Message

  attr_reader :id, :content, :time, :author

  def initialize(id:, content:, time:, author:)
    @id = id
    @content = content
    @time = time
    @author = author
  end

  def self.all
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'chitter_test')
    else
      connection = PG.connect(dbname: 'chitter')
    end 
    result = connection.exec("SELECT * FROM messages ORDER BY id DESC;")
    @array = result.map { |row| Message.new(id: row['id'], content: row['content'], time: row['time'], author: row['author']) }
  end

  def self.create(content:, time: Time.new, author:)
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'chitter_test')
    else
      connection = PG.connect(dbname: 'chitter')
    end
    result = connection.exec("INSERT INTO messages (content, time, author) VALUES('#{content}', '#{time}', '#{author}') RETURNING id, content, time, author")
    result.map { |row| Message.new(id: row['id'], content: row['content'], time: row['time'], author: row['author']) }
  end
end