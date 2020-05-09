require 'pg'
require_relative 'database_connection'

class Peep
  attr_reader :id, :username, :message, :date_time

  def initialize(id, username, message, date_time)
    @id         = id
    @username   = username
    @message    = message
    @date_time  = date_time
  end

  def self.create(username:, message:)
    result = DatabaseConnection.query("INSERT INTO peeps (username, message, date_time)
      VALUES('#{username}', '#{message}', '#{Time.new}')
      RETURNING username, message, date_time;")

    instance(result[0])
  end

  def self.all
    peeps = DatabaseConnection.query("SELECT * FROM peeps")
    peeps.map { |peep| instance(peep) }
  end

  def self.instance(peep)
    Peep.new(peep['id'], peep['username'], peep['message'], peep['date_time'])
  end

  private_class_method :instance
end
