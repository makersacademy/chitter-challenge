require 'pg'

class Peep

  attr_reader :message, :creator, :id

  def initialize(message:, creator:, id:)
    @message = message
    @creator = creator
    @id = id
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
      Peep.new(message: peep['message'], creator: peep['creator'], id: peep['id'])
    end
  end

  def self.list_ordered_peeps
    peeps = all
    peeps.reverse
  end

  def self.create(message:, creator:)
    connect_to_db
    result = @@connection.exec "INSERT INTO peeps (message, creator) VALUES ('#{message}', '#{creator}') RETURNING id, message, creator;"
    Peep.new(message: result[0]['message'], creator: result[0]['creator'], id: result[0]['id'])
  end
end