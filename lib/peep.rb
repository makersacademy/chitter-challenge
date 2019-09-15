class Peep
  attr_reader :id, :peep

  def initialize(id:, peep:)
    @id = id
    @peep = peep
  end

  def self.create(peep)
    conn = connect_database

    res = conn.exec("INSERT INTO peeps (peep) VALUES ('#{peep}') RETURNING id, peep")
    Peep.new(id: res[0]['id'], peep: res[0]['peep'])
  end

  def self.all
    conn = connect_database

    res = conn.exec("SELECT * FROM peeps")
    res.map do |peep|
      Peep.new(id: peep['id'], peep: peep['peep'])
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
end
