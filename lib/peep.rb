require 'pg'

class Peep

  attr_reader :id, :message

  def initialize(id:, message:)
    @id = id
    @message = message
  end

  def self.all
    ENV['ENVIRONMENT'] == 'test' ? connection = PG.connect(dbname: 'chitter_test') : connection = PG.connect(dbname: 'chitter')
    result = connection.exec("SELECT * FROM peeps")
    result.map do |peep|
      Peep.new(id: peep['id'], message: peep['message'])
    end
  end

  def self.create(message:)
    ENV['ENVIRONMENT'] == 'test' ? connection = PG.connect(dbname: 'chitter_test') : connection = PG.connect(dbname: 'chitter')
    result = connection.exec_params("INSERT INTO peeps (message) VALUES($1) RETURNING id, message;", [message])
    Peep.new(id: result[0]['id'], message: result[0]['message'])
  end

end
