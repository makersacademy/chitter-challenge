require_relative 'database_connection.rb'

class Peep 
  attr_reader :id, :message
  def initialize(id:,message:)
    @id = id
    @message = message
  end

  def self.create(message)
    conn = PG.connect(dbname: 'chitter')
    result = conn.exec_params("INSERT INTO peeps(message) VALUES($1) RETURNING id, message;", [message])
    Peep.new(id: result[0]['id'], message: result[0]['message'])
  end

  def self.all
    conn = PG.connect(dbname: 'chitter')
    result = conn.exec("SELECT * FROM peeps;")
    result.map { |peep| Peep.new(id: peep['id'], message: peep['message']) }
  end

end