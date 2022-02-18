require 'pg'

class Peep

  attr_reader :id, :message, :created_at

  def initialize(id:, message:, created_at:)
    @id = id
    @message = message
    @created_at = created_at[0...-7]
  end

  def self.all
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'chitter_test')
    else
      connection = PG.connect(dbname: 'chitter')
    end

    result = connection.exec("SELECT * FROM peeps;")
    result.map {
      |peep|
      Peep.new(id: peep['id'], message: peep['message'], created_at: peep['created_at'])
    }
  end

  def self.create(message:)
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'chitter_test')
    else
      connection = PG.connect(dbname: 'chitter')
    end

    result = connection.exec("INSERT INTO peeps (message) VALUES('#{message}') RETURNING id, message, created_at;")
    Peep.new(id: result[0]['id'], message: result[0]['message'], created_at: result[0]['created_at'])
  end
end