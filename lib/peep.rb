# require 'pg'
require_relative './database_connection'


class Peep
  attr_reader :id, :username, :message, :time

  def initialize(id, username, message, time)
    @id = id
    @username = username
    @message = message
    @time = time
  end
  def self.all
    result = DatabaseConnection.query("SELECT * FROM peeps")
    result.map { |peep| peep['message'] }
  end

  def self.create(params)
    result = DatabaseConnection.query("INSERT INTO peeps(message) VALUES('#{params[:peep]}')")
    # DatabaseConnection.query("INSERT INTO peeps(id, username, message, time) VALUES('#{params[:id]}', '#{params[:username]}', '#{params[:peep]}', '#{Time.now}')")
    # Peep.new(result[0]['id'], result[0]['username'], result[0]['message'], result[0]['time'])
    result.map { |peep| peep['message']}
  end
end
