require 'pg'
require 'Date'

class Peep

  attr_reader :id, :peep_text, :user_id, :time
  
  def initialize(id:, peep_text:, user_id:, time:)
    @id = id
    @peep_text = peep_text
    @user_id = user_id
    @time = time
  end

  def self.all
    result = DatabaseConnection.query("SELECT * FROM peeps ORDER BY id DESC;")
    result.map do |peep|
      Peep.new(id: peep['id'], peep_text: peep['peep_text'], user_id: peep['user_id'], time: peep['time'])
    end
  end

  def self.create(peep_text:, user_id:)
    result = DatabaseConnection.query(
      "INSERT INTO peeps (peep_text, user_id, time) VALUES($1, $2, '#{Time.now.strftime("%d-%b - %H:%M")}' ) RETURNING id, peep_text, user_id, time;", [peep_text, user_id])
    Peep.new(id: result[0]['id'], peep_text: result[0]['peep_text'], user_id: result[0]['user_id'], time: result[0]['time'])
  end

  def self.select(user_id:)
    result = DatabaseConnection.query("SELECT * FROM peeps WHERE user_id = '#{user_id}' ORDER BY id DESC;")
    result.map do |peep|
      Peep.new(id: peep['id'], peep_text: peep['peep_text'], user_id: peep['user_id'], time: peep['time'])
    end
  end

end



  

  

  
