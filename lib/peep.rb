require 'pg'
require 'time'
require_relative './database_connection'


class Peep
  attr_reader :id, :peep, :time, :username

  def initialize(id, peep, time, username = nil)
    @id = id
    @peep = peep
    @time = time
    @username = username
  end

  def self.save(options)
    result = DatabaseConnection.query("INSERT INTO peep_log (peep, time, username) VALUES('#{options[:peep]}', '#{Time.new.strftime("%H:%M %d/%m/%y")}', '#{options[:username]}') RETURNING id, peep, time, username;")
    Peep.new(result[0]['id'], result[0]['peep'], result[0]['time'], result[0]['username'])
  end

  def self.all
    result = DatabaseConnection.query("SELECT * FROM peep_log ORDER BY id DESC;")
    result.map { |peep| Peep.new(peep['id'], peep['peep'], peep['time'], peep['username']) }
  end

end
