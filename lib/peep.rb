class Peep
  attr_reader :id, :peep, :time

  def initialize(id:, peep:, time:)
    @id = id
    @peep = peep
    @time = time
  end

  def self.create(peep)
    conn = connect_database
    time = Peep.time

    res = conn.exec("INSERT INTO peeps (peep, time) VALUES ('#{peep}', '#{time}') RETURNING id, peep, time")
    Peep.new(id: res[0]['id'], peep: res[0]['peep'], time: res[0]['time'])
  end

  def self.all
    conn = connect_database

    res = conn.exec("SELECT * FROM peeps")
    res.map do |peep|
      Peep.new(id: peep['id'], peep: peep['peep'], time: peep['time'])
    end
  end

  private

  def self.connect_database
    if ENV['ENVIRONMENT'] == 'test'
        conn = PG.connect(dbname: 'chitter_test')
    else
        conn = PG.connect(dbname: 'chitter')
    end
  end

  def self.time
    t = Time.now
    t.strftime '%d %B %Y - %H:%M'
  end
end
