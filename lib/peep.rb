require 'pg'
class Peep
  attr_reader :id, :message

  def initialize(id:, message:)
    @id = id
    @message = message
  end

  def self.all   #accessing databse thu ruby
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'chitter_test')
    else
      connection = PG.connect(dbname: 'chitter')
    end
    result = connection.query('SELECT * FROM peep')
    #we will need to update Peep.new to take two parameters: so added line 6-7
    result.map { |peep| Peep.new(id: peep['id'], message: peep['message'])}
    end

  def self.create(message:)
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'chitter_test')
    else
      connection = PG.connect(dbname: 'chitter')
    end
    result = connection.exec "INSERT INTO peep (message) VALUES('#{message}') RETURNING id, message;"
    result.map { |peep| Peep.new(id: peep['id'], message: peep['message'])}
    end
end
