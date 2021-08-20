require 'pg'

class Peep
  attr_reader :id, :message

  def initialize(id:, message:)
    @id = :id
    @message = message
  end

  def self.all
    connection = PG.connect(dbname: 'chitter_manager')
    results = connection.exec('SELECT * FROM peeps;')
    results.map { |result| {id: result['id'], message: result['message']} }
  end

  def self.create(message:)
    connection = PG.connect(dbname: 'chitter_manager')
    result = connection.exec_params("INSERT INTO peeps (message) VALUES ('#{message}') RETURNING message;")
    Peep.new(id: result[0]['id'], message: result[0]['message'])
  end

end