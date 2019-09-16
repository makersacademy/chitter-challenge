require 'pg'

class Peeps

  attr_reader :id, :created_at, :peep

  def initialize(id:, created_at:, peep:)
    @id = id
    @created_at  = created_at
    @peep = peep
  end

  def self.all
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'chitter_test') #connects to db
    else
      connection = PG.connect(dbname: 'chitter')
    end

    result = connection.exec("SELECT * FROM peeps_timeline ORDER BY id DESC;") #displays tables
    result.map do |post|#displays each peep post individually
      Peeps.new(id: post['id'], created_at: post['created_at'], peep: post['peep'])
    end
  end

  def self.add(message:)
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'chitter_test') #connects to db
    else
      connection = PG.connect(dbname: 'chitter')
    end
    result = connection.exec("INSERT INTO peeps_timeline (peep) VALUES ('#{message}') RETURNING id, peep,created_at,peep;")
    Peeps.new(id: result[0]['id'], created_at: result[0]['created_at'], peep: result[0]['peep'])
  end
end
