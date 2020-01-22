require 'pg'
require_relative 'database_connection'

class Peeps

  attr_reader :id, :message, :time

  def initialize(id:, message:, time:)
    @id = id
    @message = message
    @time = time
  end

  def self.all
      result = DatabaseConnection.query("SELECT * from peep ORDER by id DESC;")
      result.map do |peep|
      Peeps.new(id: peep['id'], message: peep['message'], time: peep['time'])
  end
end

  def self.create(message:,time: Time.now)
      result = DatabaseConnection.query("INSERT INTO peep (message, time) VALUES('#{message}','#{time}') RETURNING id,message,time;")
      Peeps.new(id: result[0]['id'], message: result[0]['message'],time: result[0]['time'])
  end
end
