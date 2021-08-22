require_relative 'db_connect'

class Peep
  attr_reader :id, :message, :posted

  def initialize(id:, message:, posted:)
    @id = :id
    @message = message
    @posted = :posted
  end

  def self.all
    connection = DBConnect.check_environment
    results = connection.exec('SELECT * FROM peeps;')
    peeps = results.map { |result| {id: result['id'].to_i, message: result['message'], posted: result['posted']} }
    reverse_chronological(peeps)
  end

  def self.create(message:, posted:)
    connection = DBConnect.check_environment
    result = connection.exec_params('INSERT INTO peeps (message, posted) VALUES ($1, $2) RETURNING message;', [message, posted])
    Peep.new(id: result[0]['id'], message: result[0]['message'], posted: result[0]['posted'] )
  end

  private

  def self.reverse_chronological(arr)
    arr.sort_by { |result| result[:time] }.reverse
  end

end
