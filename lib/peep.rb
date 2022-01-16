require 'pg'

class Peep
  attr_reader :id, :print

  def initialize(id:, peep:)
    @id = id
    @print = peep
  end

  def self.all
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect dbname: 'chitter_web_test'
    else 
      connection = PG.connect dbname: 'chitter_web'
    end
  
    result = connection.exec "SELECT * FROM peeps;"
  
    result.map { |peep| Peep.new(id: peep['id'], peep: peep['post']) }
  end

  def self.create(peep:)
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect dbname: 'chitter_web_test'
    else 
      connection = PG.connect dbname: 'chitter_web'
    end
  
    result = connection.exec_params "INSERT INTO peeps (post) VALUES ($1)" \
      "RETURNING id, post;", [peep]

    Peep.new(id: result[0]['id'], peep: result[0]['post'])
  end
end
