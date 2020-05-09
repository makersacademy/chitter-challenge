require 'pg'
require_relative 'database_connection'

class Peep
  attr_reader :id, :user_id, :message, :date_time

  def initialize(id, user_id, message, date_time)
    @id         = id
    @user_id    = user_id
    @message    = message
    @date_time  = date_time
  end

  def user
    result = DatabaseConnection.query("SELECT * FROM users WHERE id = #{@user_id}")
    User.new(result[0]['id'], result[0]['name'], result[0]['email'], result[0]['password'])
  end

  def self.create(user_id:, message:)
    result = DatabaseConnection.query("INSERT INTO peeps (user_id, message, date_time)
      VALUES('#{user_id}', '#{message}', '#{Time.new}')
      RETURNING id, user_id, message, date_time;")

    instance(result[0])
  end

  def self.all
    peeps = DatabaseConnection.query("SELECT * FROM peeps")
    peeps.map { |peep| instance(peep) }
  end

  def self.instance(peep)
    Peep.new(peep['id'], peep['user_id'], peep['message'], peep['date_time'])
  end

  private_class_method :instance
end
