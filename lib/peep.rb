require 'pg'
require_relative './database_connection_setup.rb'

class Peep

  attr_reader :message, :id, :time

  def initialize(id, message, time)
    @id = id
    @message = message
    @time = time
  end

  def self.all
    result = DatabaseConnection.query("SELECT * FROM peeps")
    result.map { |peep| Peep.new(peep['id'], peep['message'],
      peep['time']) }.reverse
  end

  def self.create(message, time)
    DatabaseConnection.query("INSERT INTO peeps (message, time) VALUES
    ('#{message}', '#{time}')")
  end
end
