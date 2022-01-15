class Peeps

  attr_reader :id, :message

  def initialize(id:, message:)
    @id = id
    @message = message
  end

  def self.post(message)
    connection = PG.connect(dbname: 'chitter_test')
    new_peep = connection.exec_params("INSERT INTO peeps(message) VALUES($1) RETURNING id, message;", [message])

    Peeps.new(id: new_peep[0]['id'], message: new_peep[0]['message'])
  end
  
end