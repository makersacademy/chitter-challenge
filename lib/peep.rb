require_relative 'db_connect'

class Peep
  attr_reader :id, :message

  def initialize(id:, message:)
    @id = :id
    @message = message
  end

  def self.all
    connection = DBConnect.check_environment
    results = connection.exec('SELECT * FROM peeps;')
    results.map { |result| {id: result['id'], message: result['message'], time: result['posted']} }
  end

  def self.create(message:)
    connection = DBConnect.check_environment
    result = connection.exec_params('INSERT INTO peeps (message) VALUES ($1) RETURNING message;', [message])
    Peep.new(id: result[0]['id'], message: result[0]['message'])
  end

end
