require_relative './database_connection'

class Peep

  attr_reader :id, :message, :user_name, :timeofpeep

  def initialize(id:, message:, user_name:, timeofpeep:)
    @id = id
    @message = message
    @user_name = user_name
    @timeofpeep = timeofpeep
  end

  def self.all
    peeps = DatabaseConnection.query("SELECT * FROM peeps;")
    peeps.map do |peep|
      Peep.new(
        id: peep['id'],
        message: peep['message'],
        user_name: peep['user_name'],
        timeofpeep: peep['timeofpeep']
      )
    end
  end

  def self.create(message:, user_name:, timeofpeep:)
    result = DatabaseConnection.query("INSERT INTO peeps (message, user_name, timeofpeep) VALUES ('#{message}', '#{user_name}', '#{timeofpeep.strftime("%Y-%m-%d %k:%M")}' ) RETURNING id, message, user_name, timeofpeep;")
    Peep.new(id: result[0]['id'], message: result[0]['message'], user_name: result[0]['user_name'], timeofpeep: result[0]['timeofpeep'])
  end

  def self.delete(id:)
    DatabaseConnection.query("DELETE FROM peeps WHERE id = #{id};")
  end

end
