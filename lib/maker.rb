require 'pg'


class Maker

  attr_reader :peep, :username, :datetime #and all additional ones for other database

  def initialize(id:, peep:, username:, datetime:)
    @id = id
    @peep = peep
    @username = username
    @datetime = datetime
  end

  def self.all
    if ENV['ENVIRONMENT'] == "test"
      connection = PG.connect(dbname:'chitter_test')
    else
      connection = PG.connect(dbname: 'chitter')
    end

    result = connection.exec("SELECT * FROM peeps ORDER BY datetime DESC")
    result.map do |peep|
       puts peep[peep: peep], peep[username: username], peep[time: date_and_time]
    end
  end

  def self.create_peep(peep:, datetime:)  #shouldn't have to fill in username, will pop up automatically.
    if ENV['ENVIRONMENT'] == "test"
      connection = PG.connect(dbname:'chitter_test')
    else
      connection = PG.connect(dbname: 'chitter')
    end

    result = connection.exec("INSERT INTO peeps (peep, datetime) VALUES ('#{peep}', '#{datetime}') RETURNING id, username, peep, datetime;")
    Maker.new(id: result[0]['id'], peep: result[0]['peep'], username: result[0]['username'], datetime: result[0]['datetime'])
  end
end
