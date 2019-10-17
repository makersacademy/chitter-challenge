require 'pg'
require_relative 'database_connection'
require_relative 'user'

class Peep
  attr_reader :id, :text, :time, :user_name, :user_id

  def initialize(id:, text:, time:, user_id:)
    @id = id
    @text = text
    @time = time
    @user_name = User.find(user_id).user_name
  end

  def self.all
    peeps = DatabaseConnection.query('SELECT * FROM peeps;')
    peeps.map do |peep|
      Peep.new(id: peep['id'], text: peep['text'], time: peep['time'], user_id: peep['user_id'])
    end
  end
  
  def self.create(text:, time:, user_id:)
    result = DatabaseConnection.query("INSERT INTO peeps (text,time, user_id) VALUES('#{text}','#{time}','#{user_id}') RETURNING id, text, time, user_id;")
    Peep.new(id: result[0]['id'], text: result[0]['text'], time: result[0]['time'], user_id: result[0]['user_id'])
  end
end
