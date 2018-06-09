require 'pg'
require 'time'
require_relative './database_connection'


class Peep
  attr_reader :id, :peep, :time

  def initialize(id, peep, time)
    @id = id
    @peep = peep
    @time = time
  end

  def self.save(options)
    result = DatabaseConnection.query("INSERT INTO peep_log (peep, time) VALUES('#{options[:peep]}', '#{Time.new.strftime("%H:%M %d/%m/%y")}') RETURNING id, peep;")
    Peep.new(result[0]['id'], result[0]['peep'], result[0]['time'])
  end

  def self.all
    result = DatabaseConnection.query("SELECT * FROM peep_log ORDER BY id DESC;")
    result.map { |peep| Peep.new(peep['id'], peep['peep'], peep['time']) }
  end

end
