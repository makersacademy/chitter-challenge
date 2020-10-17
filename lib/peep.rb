require_relative('./database_connection')
require 'time'

class Peep

  attr_reader :time, :message

  def initialize(message:, user_id:, time:, user_name:)
    @message = message
    @time = time
    @user_id = user_id
    @user_name = user_name
  end

  def self.create(message: ,user_id: ,user_name:)
    time = Time.now.strftime("%d/%m/%Y %H:%M:%S")
    DatabaseConnection.query("INSERT into peeps(message, time, user_id, user_name) VALUES ('#{message}', '#{time}', '#{user_id}', '#{user_name}')")
  end

  def self.all
    res = DatabaseConnection.query("SELECT * FROM peeps")
    res.map do |peep|
      new(message: peep['message'], time: peep['time'], user_id: peep['user_id'], user_name: peep['user_name'])
    end
  end
end
