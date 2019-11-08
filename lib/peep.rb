require "pg"

class Peep
  attr_reader :peeptext, :username, :dateposted, :timeposted

  def initialize(peeptext:, username: "guest", dateposted: "#{Time.now.day}/#{Time.now.month}/#{Time.now.year}", timeposted: "#{Time.now.hour}:#{Time.now.min}:#{Time.now.sec}")
    @peeptext = peeptext
    @username = username
    @dateposted = dateposted
    @timeposted = timeposted
  end

  def self.all
    if ENV["ENVIRONMENT"] == "test"
      connection = PG.connect(dbname: "chitter_peeps_test")
    else
      connection = PG.connect(dbname: "chitter_peeps_manager")
    end

    peeps = connection.exec("SELECT * FROM chitter_peeps;")
    peeps.map do |peep|
      Peep.new(
        peeptext: peep["peep"],
        username: peep["username"],
        dateposted: peep["dateposted"],
        timeposted: peep["timeposted"],
      )
    end
  end

  def self.create(peeptext:, username: "guest", dateposted: "#{Time.now.day}/#{Time.now.month}/#{Time.now.year}", timeposted: "#{Time.now.hour}:#{Time.now.min}:#{Time.now.sec}")
    if ENV["ENVIRONMENT"] == "test"
      connection = PG.connect(dbname: "chitter_peeps_test")
    else
      connection = PG.connect(dbname: "chitter_peeps_manager")
    end

    result = connection.exec("INSERT INTO chitter_peeps (peep, username, dateposted, timeposted) VALUES ('#{peeptext}', '#{username}', '#{dateposted}', '#{timeposted}') RETURNING peep, username, dateposted, timeposted; ")
    Peep.new(peeptext: result[0]["peeptext"], username: result[0]["username"], dateposted: result[0]["dateposted"], timeposted: result[0]["timeposted"])
  end
end
