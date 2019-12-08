require 'pg'

class Chitter
  attr_reader :id, :message, :date

  def initialize(id:, message:, date:)
    @id = id
    @message = message
    @date = date
  end

  def self.all
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'chitter_db_test')
    else
      connection = PG.connect(dbname: 'chitter_db')
    end
    result = connection.exec("select * from chitter")
    result.map { |chitter|
      Chitter.new(id: chitter['id'], message: chitter['message'], date: chitter['date'])
    }
  end

  def self.create(message:)
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'chitter_db_test')
    else
      connection = PG.connect(dbname: 'chitter_db')
    end
    result = connection.exec(
      "insert into chitter (message) values('#{message}') RETURNING id, message, date;"
      )
    Chitter.new(id: result[0]['id'], message: result[0]['message'], date: result[0]['date'])
  end
end
