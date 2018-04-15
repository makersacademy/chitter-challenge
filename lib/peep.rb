require_relative './database_connection'


class Peep
  attr_reader :id, :username, :message, :time

  def initialize(options)
    @id = options[:id]
    @username = options[:username]
    @message = options[:message]
    @time = options[:time]
  end
  def self.all
    result = DatabaseConnection.query("SELECT * FROM peeps")
    result.map { |peep|
      Peep.new(
        id: peep['id'],
        username: peep['username'],
        message: peep['message'],
        time: peep['time']) }
  end

  def self.create(options)
     DatabaseConnection.query("INSERT INTO peeps(username, message, time) VALUES('#{options[:username]}', '#{options[:peep]}', '#{Time.now}')")
  end
  private

  def self.time
    Time.now.strftime "%H:%M:%S | %a | %d-%b-%y"
  end
end
