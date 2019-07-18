require 'pg'
 # when you create a new instance of an object, you can add time stamp with time.now
 # or such. then yu add time stamp to database. set it as attribute?
class Peeps

  attr_reader :id, :peep, :name

   def initialize(id:, peep:, name:, time:)
    @id  = id
    @peep = peep
    @name = name
    @time = Time.now
  end

  def self.all
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'chitter_peeps_test')
    else
      connection = PG.connect(dbname: 'chitter_peeps')
    end

    result = connection.exec("SELECT * FROM peeps;")
    result.map { |peep|
      Peeps.new(
        id: peep['id'],
        peep: peep['peep'],
        name: peep['name']
      ) }
  end

  def self.create(peep:)
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'chitter_peeps_test')
    else
      connection = PG.connect(dbname: 'chitter_peeps')
    end

    result = connection.exec("INSERT INTO peeps (peep) VALUES('#{peep}')
    RETURNING id, peep, name;")
    Peeps.new(id: result[0]['id'], peep: result[0]['peep'],
      name: result[0]['name'])
  end

  def self.delete(id:)
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'chitter_peeps_test')
    else
      connection = PG.connect(dbname: 'chitter_peeps')
    end
    connection.exec("DELETE FROM peeps WHERE id = #{id}")
  end

end
