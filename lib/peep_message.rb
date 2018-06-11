require_relative './database_connection'

class PeepMessage

  attr_reader :id, :message, :name, :username, :time

  def initialize(id, message, name, username, time)
    @id = id
    @message = message
    @name = name
    @username = username
    @time = time
  end

  def ==(other)
    @id == other.id
  end

  def self.all
    result = DatabaseConnection.query("SELECT * FROM peeps")
    result.to_a.reverse.map do |peep|
      PeepMessage.new(peep['id'], peep['message'], peep['name'],
                      peep['username'], peep['time'])
    end
  end

  def self.create(message, name, username, time)
    result = insert_into_database(message, name, username, time)
    id = result.first['id']
    peep_message = result.first['message']
    peep_name = result.first['name']
    peep_username = result.first['username']
    peep_time = result.first['time']
    PeepMessage.new(id, peep_message, peep_name, peep_username, peep_time)
  end

  private_class_method

  def self.insert_into_database(message, name, username, time)
    DatabaseConnection.query(
      "INSERT INTO peeps (message, name, username, time)
      VALUES ('#{message}', '#{name}', '#{username}', '#{time}')
      RETURNING peep_id, message, name, username, time"
    )
  end
end
