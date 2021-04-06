require_relative 'user'
# require 'strftime'

class Peep

  attr_reader :id, :message, :time_last_altered, :user_id

  def initialize(id:, message:, time_last_altered:, user_id:)
    @id = id
    @message = message
    @time_last_altered = time_last_altered
    @user_id = user_id
  end

  def self.all
    result = DatabaseConnection.query('SELECT * FROM peeps;')
    result.map do |peep|
      Peep.new(id: peep['id'], message: peep['message'], 
time_last_altered: peep['time_last_altered'], user_id: peep['user_id'])
    end
  end

  def self.create(message:, user_id:, time_last_altered: Time.now.to_s)
    result = DatabaseConnection.query("INSERT INTO peeps (message, 
      time_last_altered, user_id) VALUES('#{message}', '#{time_last_altered}', 
      '#{user_id}') RETURNING id, message, user_id, time_last_altered")
    Peep.new(id: result[0]['id'], message: result[0]['message'], 
time_last_altered: result[0]['time_last_altered'], user_id: result[0]['user_id']) 
  end

  def self.delete(id:)
    DatabaseConnection.query("DELETE FROM peeps WHERE id = '#{id}'")
  end

  def self.find(id:)
    result = DatabaseConnection.query("SELECT * FROM peeps WHERE id = '#{id}'")
    Peep.new(id: result[0]['id'], message: result[0]['message'], 
time_last_altered: result[0]['time_last_altered'], user_id: result[0]['user_id'])
  end

  def self.update(id:, message:, time_last_altered: Time.now)
    result = DatabaseConnection.query("UPDATE peeps SET message = '#{message}', 
      time_last_altered ='#{time_last_altered}' WHERE id = #{id} RETURNING id, 
      message, time_last_altered, user_id;")
    Peep.new(id: result[0]['id'], message: result[0]['message'], 
time_last_altered: result[0]['time_last_altered'], user_id: result[0]['user_id'])
  end

  def find_users_name
    DatabaseConnection.query("SELECT * FROM users WHERE id = '#{user_id}'")[0]['name']
  end

  def find_users_username
    DatabaseConnection.query("SELECT * FROM users WHERE id = '#{user_id}'")[0]['username']
  end 

  def show_date 
    date = time_last_altered.to_s
    "#{date[8..9]}/#{date[5..6]}/#{date[2..3]} at #{date[11..15]}"
  end
end
