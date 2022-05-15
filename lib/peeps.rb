require 'pg'

class Peeps

  attr_reader :id, :first_name, :handle, :peep

  def initialize(id, first_name, handle, peep)
    @id = id
    @first_name = first_name
    @handle = handle
    @peep = peep
  end

  def self.all
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'chitter_test')
    else
      connection = PG.connect(dbname: 'chitter')
    end

    result = connection.exec("SELECT * FROM peeps;")
    result.map { |peep| 
      Peeps.new(peep['id'], peep['first_name'], peep['handle'], peep['peep'])
    }
  end

  def self.new_peep(first_name, handle, peep)
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'chitter_test')
    else
      connection = PG.connect(dbname: 'chitter')
    end
    result = connection.exec("INSERT INTO peeps (first_name, handle, peep) VALUES ('#{first_name}', '#{handle}', '#{peep}') RETURNING id, handle, first_name, peep;")
    Peeps.new(result[0]['id'], result[0]['first_name'], result[0]['handle'], result[0]['peep'])
  end
end