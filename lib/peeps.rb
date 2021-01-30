require 'pg'
class Peeps

  attr_reader :id, :peep

  def initialize(id:, peep:)
    @id = id
    @peep = peep
  end

  def self.create(peep:)
    if ENV['Environment'] == 'test'
      connection = PG.connect(dbname: 'chitter_chatter_test')
    else
      connection = PG.connect(dbname: 'chitter_chatter')
    end
    result = connection.exec("INSERT INTO peeps (peep) VALUES('#{peep}') RETURNING id, peep;")
    Peeps.new(id: result[0]['id'], peep: result[0]['peep'])
  end

  def self.find(id:)
    if ENV['Environment'] == 'test'
      connection = PG.connect(dbname: 'chitter_chatter_test')
    else
      connection = PG.connect(dbname: 'chitter_chatter')
    end
    result = connection.exec("SELECT * FROM peeps WHERE id = #{id};")
    Peeps.new(id: result[0]['id'], peep: result[0]['peep'])
  end
end
