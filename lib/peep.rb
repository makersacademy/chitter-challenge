require 'pg'
require_relative 'database_connection'
require_relative 'user'

class Peep
  attr_reader :content, :id, :time, :user_id
  
  def initialize(content, id, time, user_id = nil)
    @content = content
    @id = id
    @time = time
    @user_id = user_id
  end

  def self.create(content, user_class = User)
    account = Peep.user(user_class)
    time = current_time
    result = account == "Anonymous" ? create_anon_peep(content, time) : create_user_peep(content, time, account)
    @peep = Peep.new(result[0]['content'], result[0]['id'], result[0]['time'], result[0]['user_id'])
  end

  def self.create_anon_peep(content, time)
    DatabaseConnection.query("INSERT INTO peeps (content, time) VALUES('#{content}', '#{time}') RETURNING id, content, time;")
  end

  def self.create_user_peep(content, time, account)
    DatabaseConnection.query("INSERT INTO peeps (content, time, user_id) VALUES('#{content}', '#{time}', '#{account.id}') RETURNING id, content, time, user_id;")
  end

  def self.current_time
    Time.now.strftime("%d/%m/%Y, %I:%M %p")
  end

  def self.all
    result = DatabaseConnection.query("SELECT * FROM peeps;")
    result.map do |peep|
        Peep.new(peep['content'], peep['id'], peep['time'], peep['user_id'])
    end
  end

  def self.user(user_class = User)
    user_class.current_user 
  end

  def user_handle
    return "Anonymous" if @user_id.nil?
    
    user = User.find(@user_id)
    user.username
  end

  def user_name
    return "Anonymous" if @user_id.nil?

    user = User.find(@user_id)
    user.name
  end
end
