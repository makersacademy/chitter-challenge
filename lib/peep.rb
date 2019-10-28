require 'pg'

class Peep

  attr_reader :id, :peep

  def initialize(id:, peep:)
    @id  = id
    @peep = peep
  end

  def self.all
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'chitter_test_database')
      p 'testing data'
    else
      connection = PG.connect(dbname: 'chitter_database')
      p 'normal database'
    end
    result = connection.exec("SELECT * FROM chitter")
    result.map do |chitter|
      Peep.new(id: peep['id'], peep: chitter['peep'])
    end
  end

  def self.create(peep:)
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'chitter_test_database')
    else
      connection = PG.connect(dbname: 'chitter_database')
    end
    result = connection.exec("INSERT INTO bookmarks (peep) VALUES('#{peep}') RETURNING id, peep;")
    Peep.new(id: result[0]['id'], peep: result[0]['peep'])
  end

  # run! if app_file == $0

end
