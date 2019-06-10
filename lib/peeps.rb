require 'pg'
require './lib/select_database.rb'

class Peeps
  attr_reader :peeps, :date
  def initialize(peeps, date)
    @peeps = peeps
    @date = date
  end

  def self.all
    connection = select_database
    result = connection.exec('SELECT * FROM peeps;')
    result.reverse_each.map { |peeps| Peeps.new(peeps['peeps'], peeps['datenow']) }
  end

  def self.create(peep, date_now)
    connection = select_database
    connection.exec("INSERT INTO peeps (peeps, datenow) VALUES('#{peep}', '#{date_now}');")
  end

end