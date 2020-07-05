require 'pg'

class Chitter

  attr_reader :id, :message

  def initialize(id:, message:)
    @id  = id
    @message = message
  end

  def self.all
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'chitter_test')
    else
      connection = PG.connect(dbname: 'chitter')
    end

    result = connection.exec('SELECT * FROM peep')
    result.map do |chitter|
    Chitter.new(id: chitter['id'], message: chitter['message'].strip)
    end
  end

  def self.create(message:)

    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'chitter_test')
    else
      connection = PG.connect(dbname: 'chitter')
    end

    result = connection.exec("INSERT INTO peep (message) VALUES ('#{message}') RETURNING id, message;")
    Chitter.new(id: result[0]['id'], message: result[0]['message'].strip)
  end
end