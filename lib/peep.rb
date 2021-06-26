require_relative 'database_connection'

class Peep
  attr_reader :id, :peep, :author, :timedate

  def initialize(id:, peep:, author:, timedate:)
    @id = id
    @peep = peep
    @author = author
    @timedate = timedate
  end

  def self.create(peep:, author:)
    result = DatabaseConnection.query("INSERT INTO chitter (peep, author) VALUES('#{peep}', '#{author}') RETURNING id, peep, author, timedate;")
    Peep.new(id: result[0]['id'], peep: result[0]['peep'], author: result[0]['author'], timedate: result[0]['timedate'])
  end

end