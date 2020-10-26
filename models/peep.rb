require 'pg'
require_relative 'database'

class Peep

  attr_reader :message, :creator, :id, :time

  def initialize(message:, creator:, id:, time:)
    @creator = creator
    @id = id
    @message = message
    @time = format(time)
  end

  def self.all
    Database.connect
    table = Database.select_all
    table.map do |peep|
      Peep.new(
        message: peep['message'], 
        creator: peep['creator'], 
        id: peep['id'], 
        time: peep['time_created']
        )
    end
  end

  def self.list_ordered_peeps
    peeps = all
    peeps.reverse
  end

  def self.create(message:, creator:)
    message = format_apostrophes(message)
    Database.connect
    add_to_db(message, creator)
  end

  def self.add_to_db(message, creator)
    result = Database.add_with_return_values(message, creator)
    Peep.new(
      message: result[0]['message'], 
      creator: result[0]['creator'], 
      id: result[0]['id'], 
      time: result[0]['time_created']
      )
  end

  def format(time)
    parsed_time = DateTime.parse(time)
    parsed_time.strftime('%d/%m/%Y %I:%M %p')
  end

  def self.format_apostrophes(message)
    message.gsub(/'/, "''")
  end
end
