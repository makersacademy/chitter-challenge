require 'pg'

class Peeps

  attr_reader :id, :peep, :created_at

  def initialize(id:, peep:, created_at:)
    @id = id
    @peep = peep
    @created_at = created_at
  end

  def self.all
    result = database_connect.exec("SELECT * FROM peeps;")
    result.map do |peeps|
      Peeps.new(id: peeps['id'], peep: peeps['peep'], created_at: peeps['created_at'])
    end
  end

  def self.create(peep)
    result = database_connect.exec("INSERT INTO peeps (peep, created_at) VALUES('#{peep}', '#{created_time}') RETURNING id, peep, created_at;")
    # Peeps.new(id: result[0]['id'], peep: result[0]['peep'], created_at: result[0]['created_at'])
  end

  def self.created_time
    return Time.at(Time.now.to_i).strftime("%B %e, %Y at %I:%M %p")
  end

  def self.database_connect
    if ENV['RACK_ENV'] == 'test'
      connection = PG.connect(dbname: 'chitter_test')
    else
      connection = PG.connect(dbname: 'chitter')
    end
  end

end
