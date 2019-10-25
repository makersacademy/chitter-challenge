require_relative 'database_connection'
require 'uri'
require_relative './tag'

class Peep
  def self.all
    peeps = DatabaseConnection.query('SELECT * FROM peeps ORDER BY id DESC;')
    peeps.map do |peep|
      Peep.new(
        id: peep['id'],
        message: peep['messages'],
        time_stamp: peep['time_stamp'],
      )
    end
  end
#time_stamp = url
  def self.create(time_stamp:, message:)
    result = DatabaseConnection.query("INSERT INTO peeps (time_stamp, messages) VALUES('#{time_stamp}', '#{message}') RETURNING id, messages, time_stamp;")
    Peep.new(id: result[0]['id'], time_stamp: result[0]['time_stamp'], message: result[0]['messages'])
  end

  attr_reader :id, :message, :time_stamp

  def initialize(id:,  time_stamp:, message:)
    @id = id
    @message = message
    @time_stamp = time_stamp
  end

  def tags(tag_class = Tag)
    tag_class.where(peep_id: id)
  end
end
