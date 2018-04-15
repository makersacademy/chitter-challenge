require 'pg'

class Peep
  attr_reader :id, :peep, :created

  def initialize(id, peep, created)
    @id = id
    @peep = peep
    @created = created
  end

  def self.all
    result = DatabaseConnection.query("SELECT * FROM peeps ORDER BY id DESC")
    result.map { |peep| Peep.new(peep['id'], peep['peep'], peep['created']) }
  end

  def self.create(options)
    result = DatabaseConnection.query("INSERT INTO peeps (peep) VALUES('#{options[:peep]}') RETURNING id, peep, created")
    Peep.new(result.first['id'], result.first['peep'], result.first['created'])
  end

  def ==(other)
    @id == other.id
  end

end
