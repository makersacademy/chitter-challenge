# require 'pg'
require 'database_connection'
require 'time'
require 'user'


class Peep 

  attr_reader :id, :text, :user_id, :time

  def initialize(id:, text:, user_id:, time:)
    @id = id
    @text = text
    @user_id = user_id
    @time = time
    
  end

  def self.create(text:, user_id:)
    time = Time.now
    result = DatabaseConnection.query("INSERT INTO peeps (text, user_id, time) VALUES($1,$2,$3) RETURNING id, text, user_id, time;",[text, user_id, time])
    Peep.new(
      id: result[0]['id'],
      text: result[0]['text'],
      user_id: result[0]['user_id'],
      time: result[0]['time'])
  end
  
  def self.all 
    result = DatabaseConnection.query("SELECT * FROM peeps INNER JOIN users ON peeps.user_id = users.id ORDER BY peeps.id DESC;")
    result.map do |peep|
      Peep.new(id: peep['id'], text: peep['text'], time: peep['time'], user_id: peep['user_id']) 
    end
  end

  

end
