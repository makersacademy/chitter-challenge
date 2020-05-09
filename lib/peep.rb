require 'pg'

class Peep

  attr_reader :id, :peep, :created_at

  def initialize(id:, peep:, created_at:)
    @id = id
    @peep = peep
    @created_at = Time.parse(created_at).strftime("%B %e, %Y at %I:%M %p")

  end

  def self.all
    if ENV['RACK_ENV'] = 'test'
      connection = PG.connect(dbname: 'chitter-test')
    else
      connection = PG.connect(dbname: 'chitter')
    end

    result = connection.exec("SELECT * FROM peeps ORDER BY created_at DESC;")
    result.map do |peep|
      Peep.new(id: peep['id'], peep: peep['peep'], created_at: peep['created_at'])
    end
  end

  def self.create(peep:)
    if ENV['RACK_ENV'] = 'test'
      connection = PG.connect(dbname: 'chitter-test')
    else
      connection = PG.connect(dbname: 'chitter')
    end

    result = connection.exec("INSERT INTO peeps (peep) VALUES('#{peep}') RETURNING id, peep, created_at;")
    Peep.new(id: result[0]['id'], peep: result[0]['peep'], created_at: result[0]['created_at'])
  end
end
