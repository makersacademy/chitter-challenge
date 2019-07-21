require 'PG'
require_relative 'database_connection'
require 'time'

class Peep

  def self.all
    result = DatabaseConnection.query("SELECT * FROM peeps;")
    result.map do |peep|
      Peep.new(id: peep['id'], peep: peep['peep'],
        time: peep['time'], peep_user: peep['peep_user'])
    end
  end

  def self.create(peep:, time:, peep_user:)
    result = DatabaseConnection.query("INSERT INTO peeps (peep, time, peep_user) VALUES ('#{peep}','#{time}','#{peep_user}') RETURNING id, peep, time, peep_user;")
    Peep.new(id: result[0]['id'], peep: result[0]['peep'],
      time: result[0]['time'], peep_user: result[0]['peep_user'])
  end

  attr_reader :id, :peep, :time, :peep_user

  def initialize(id:, peep:, time:, peep_user:)
    @id = id
    @peep = peep
    @time = time
    @peep_user = peep_user
  end

  def uk_date
    uk_date = Time.parse(@time)
    uk_date.strftime("%d/%m/%y at %H:%M:%S")
  end
end
