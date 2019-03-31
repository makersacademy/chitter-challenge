require 'pg'

class Peep

  def self.all

    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'chitter_app_test')
    else
      connection = PG.connect(dbname: 'chitter_app')
    end

    result = connection.exec("SELECT * FROM chitter;")

    result.map do |peepdeck|
      Peep.new(peep: peepdeck['peep'])
    end
  end

  def self.create(peep:)

    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'chitter_app_test')
    else
      connection = PG.connect(dbname: 'chitter_app')
    end

    result = connection.exec("INSERT INTO chitter (peep)
    VALUES('#{peep}') RETURNING peep;")
    Peep.new(peep: result[0]['peep'])
  end

  attr_reader :peep

  def initialize(peep:)
    @peep = peep
  end
end
