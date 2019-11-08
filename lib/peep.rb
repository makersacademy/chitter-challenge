require "pg"

class Peep
  attr_reader :id, :peeptext, :username, :dateposted, :timeposted

  def initialize(id:, peeptext:, username: "guest", dateposted: "#{Time.now.day}/#{Time.now.month}/#{Time.now.year}", timeposted: "#{Time.now.hour}:#{Time.now.min}:#{Time.now.sec}")
    @id = id
    @peeptext = peeptext
    @username = username
    @dateposted = dateposted
    @timeposted = timeposted
  end

  def self.create(id:, peeptext:, username:, dateposted: "#{Time.now.day}/#{Time.now.month}/#{Time.now.year}", timeposted: "#{Time.now.hour}:#{Time.now.min}:#{Time.now.sec}")
    if ENV["ENVIRONMENT"] == "test"
      connection = PG.connect(dbname: "chitter_peeps_test")
    else
      connection = PG.connect(dbname: "chitter_peeps_manager")
    end

    connection.exec("INSERT INTO chitter_peeps (id, peep, username, dateposted, timeposted) VALUES ('#{id}, '#{peeptext}', '#{dateposted}', '#{timeposted}')")
  end
end
