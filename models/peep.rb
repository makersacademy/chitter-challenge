require 'pg'

class Peep

  attr_reader :message, :creator, :id, :time

  def initialize(message:, creator:, id:, time:)
    @creator = creator
    @id = id
    @message = message
    @time = format(time)
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
      Peep.new(message: peep['message'], creator: peep['creator'], id: peep['id'], time: peep['time_created'])
    end
  end

  def self.list_ordered_peeps
    peeps = all
    peeps.reverse
  end

  def self.create(message:, creator:)
    message = format_apostrophes(message)
    connect_to_db
    result = @@connection.exec "INSERT INTO peeps (message, creator) VALUES ('#{message}', '#{creator}') RETURNING id, message, creator, time_created;"
    Peep.new(message: result[0]['message'], creator: result[0]['creator'], id: result[0]['id'], time: result[0]['time_created'])
  end

  private

  def format(time)
    parsed_time = DateTime.parse(time)
    parsed_time.strftime('%d/%m/%Y %I:%M %p')
  end

  def self.format_apostrophes(message)
    message = message.chars.map do |char|
      if char == "'"
        char + "'"
      else
        char
      end
    end

    message.join
  end
end
