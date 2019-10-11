require 'pg'

class Peep

  attr_reader :id, :message

  def initialize(id:, message:)
    @id  = id
    @message = message
  end

  def self.all
    connection = PG.connect(dbname: 'chitter')
    result = connection.exec("SELECT * FROM peeps ORDER BY ID DESC")
    result.map do |peep|
    Peep.new(id: peep['id'], message: peep['message'])
    end
  end

  def self.create(message:)
    connection = PG.connect(dbname: 'chitter')
    result = connection.exec("INSERT INTO peeps (message) VALUES('#{message}') RETURNING message;")
    Peep.new(id: result[0]['id'], message: result[0]['message'])
  end

  def self.delete(id:)
    connection = PG.connect(dbname: 'chitter')
    connection.exec("DELETE FROM peeps WHERE id = #{id}")
  end
end
