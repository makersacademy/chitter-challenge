require 'pg'

class Peep

  attr_reader :id, :message, :name

  def initialize(id:, message:, name:)
    @id  = id
    @message = message
    @name = name
  end

  def self.all
  if ENV['ENVIRONMENT'] == 'test'
    connection = PG.connect(dbname: 'chitter_test')
  else
    connection = PG.connect(dbname: 'chitter')
  end

  result = connection.exec("SELECT * FROM peeps;")
  result.map { |peep| 
  Peep.new(id: peep['id'], message: peep['message'], name: peep['name'])
  }
  end

  def self.create(message:, name:)
  if ENV['ENVIRONMENT'] == 'test'
    connection = PG.connect(dbname: 'chitter_test')
  else
    connection = PG.connect(dbname: 'chitter')
  end
  
  result = connection.exec("INSERT INTO peeps (message, name) VALUES('#{message}', '#{name}') RETURNING id, message, name")
  Peep.new(id: result[0]['id'], message: result[0]['message'], name: result[0]['name'])
end
end