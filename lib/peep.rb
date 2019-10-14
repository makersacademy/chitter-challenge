require 'pg'

class Peep

  attr_reader :id, :peeps, :created_at

  def initialize(id:, peeps:, created_at:)
    @id = id
    @peeps = peeps
    @created_at = created_at
  end

  def self.all
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'chitter_test')
  else
    connection = PG.connect(dbname: 'chitter')
  end
    result = connection.exec("SELECT * FROM chitterbase ORDER BY created_at DESC;")
    result.map { |peep|
      Peep.new(
        id: peep['id'],
      peeps: peep['peeps'],
    created_at: peep['created_at'])
  }

  end

    def self.create(peeps:)
      if ENV['ENVIRONMENT'] == 'test'
        connection = PG.connect(dbname: 'chitter_test')
    else
      connection = PG.connect(dbname: 'chitter')
    end
      connection.exec("INSERT INTO chitterbase (peeps) VALUES('#{peeps}')")
    end

end
