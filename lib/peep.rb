require 'pg'
require_relative './database_connection'
class Peep
  attr_reader :id, :peep, :time

  def initialize(id:, peep:, time:, username:)
    @id = id
    @peep = peep
    @time = time
    @username = username
  end

  def self.all
    peep_list = []
    result = DatabaseConnection.query("SELECT * FROM chitter")
    result.map { |peep|
      peep_list << Peep.new(id: peep['id'], peep: peep['peep'], time: peep['lastmodified'], username: peep['username'])
    }
    sort_by_reverse_time(peep_list)
  end

  def username
    @username ? @username : "Anon"
  end

  def self.peep(peep:, user: user = nil)
    result = DatabaseConnection.query("INSERT INTO chitter (peep, username) VALUES('#{peep}', '#{user}') RETURNING id, peep, lastmodified, username;")
    Peep.new(id: result[0]['id'], peep: result[0]['peep'], time: result[0]['lastmodified'], username: peep['username'])
  end

  def readable_time
    date_and_time = @time.split(" ")
    date = date_and_time[0]
    time = date_and_time[1]
    hours_minutes_seconds = time.split(":")
    hours = hours_minutes_seconds[0]
    minutes = hours_minutes_seconds[1]
    years_months_days = date.split("-")
    years = years_months_days[0]
    months = years_months_days[1]
    days = years_months_days[2]
    "#{hours}:#{minutes} #{days}/#{months}/#{years}"
  end

  private

  def self.sort_by_reverse_time(peep_list)
    peep_list.sort_by { |peep| [peep.time, peep.peep]}
    peep_list.reverse
  end
end
