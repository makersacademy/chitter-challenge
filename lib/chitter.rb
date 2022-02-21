require 'pg'

class Chitter

  attr_reader :id, :message, :text

  def initialize(id:, message:, text:)
    @id  = id
    @message = message
    @text = text
  end

  def self.all
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'chitter_manager_test')
    else
      connection = PG.connect(dbname: 'chitter_manager')
    end
    result = connection.exec("SELECT * FROM chitters")
    result.map do |chitter|
      Chitter.new(id: chitter['id'], message: chitter['message'], text: chitter['text'])
    end
  end

  def self.create(text:, message:)
    if ENV['ENVIRONMENT'] == 'test'
    connection = PG.connect(dbname: 'chitter_manager_test')
    else
    connection = PG.connect(dbname: 'chitter_manager')
    end
  result = connection.exec("INSERT INTO bookmarks (text, message) VALUES('#{text}', '#{message}') RETURNING id, message, text;")
  Chitter.new(id: result[0]['id'], message: result[0]['message'], text: result[0]['text'])
  end
end