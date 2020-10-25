require 'pg'

class Peep

  attr_reader :message, :creator

  def initialize(message:, creator:)
    @message = message
    @creator = creator
  end

  def self.connect_to_db
    if ENV['RACK_ENV'] == "test"
      @@connection = PG.connect :dbname => 'peeps_test_manager'
    else
      @@connection = PG.connect :dbname => 'peeps_manager'
    end
  end

  def self.all
    connect_to_db
    table = @@connection.exec "SELECT * FROM peeps"
    table.map do |peep|
      Peep.new(message: peep['message'], creator: peep['creator'])
    end
  end
end