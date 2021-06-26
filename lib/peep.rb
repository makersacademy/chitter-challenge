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

  def self.all
    result = DatabaseConnection.query("SELECT * FROM chitter")
    result.map do |object|
      Peep.new(
        id: object['id'],
        peep: object['peep'],
        author: object['author'],
        timedate: object['timedate']
      )
    end
  end
  
end