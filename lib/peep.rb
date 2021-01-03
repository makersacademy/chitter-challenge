require 'pg'
require_relative './db_connection'

class Peep

  attr_reader :text, :time_stamp

  def initialize(text:, time_stamp:)
    @text = text
    @time_stamp = time_stamp
  end

  def self.add(peep)
    result = DatabaseConnection.query("INSERT INTO chitter (peep, username) VALUES('#{peep}', '#{user}') RETURNING id, peep")
    Peep.new(id: result[0]['id'], peep: result[0]['peep'], time_stamp: result[0]['lastmodified'])
  end

  def self.all
    peep_list = []
    result = DatabaseConnection.query("SELECT * FROM chitter")
    result.map { |peep|
      peep_list << Peep.new(id: peep['id'], peep: peep['peep'], time_stamp: peep['lastmodified'])
    }
    sort_by_reverse_time(peep_list)
  end

  def self.sort_by_reverse_time(peep_list)
    peep_list.sort_by { |peep| [peep.time, peep.peep] }
    peep_list.reverse
  end

end
