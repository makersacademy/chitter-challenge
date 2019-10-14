require 'pg'
class Peeps

  def self.all
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'test_database')
    else
      connection = PG.connect(dbname: 'devdb')
    end
    chitterings = connection.exec('SELECT * FROM chitter ORDER BY time DESC;')
    chitterings.map do |peepings|
      Peeps.new(
        id: peepings['id'],
        peep: peepings['peeps'],
        time: peepings['time']
        )
      end
  end

  def self.create(peep:)
    time = Time.new.strftime("%H:%M:%S")
    peep=peep.to_s
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'test_database')
    else
      connection = PG.connect(dbname: 'devdb')
    end
      chitterings = connection.exec("INSERT INTO chitter (peeps, time) VALUES('#{peep}', '#{time}') RETURNING id, time, peeps;")
      # Peeps.new(
      #   id: chitterings[0]['id'],
      #   peep: chitterings[0]['peeps'],
      #   time: chitterings[0]['time']
      #   )
  end


  attr_reader :id, :peep, :time

  def initialize(id:, peep:, time:)
    @id  = id
    @peep = peep
    @time = time
  end

end
